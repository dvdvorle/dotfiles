#Requires -RunAsAdministrator

echo "Setting the TNS_ADMIN variable"
[System.Environment]::SetEnvironmentVariable('TNS_ADMIN','V:\',[System.EnvironmentVariableTarget]::Machine)

echo "Install software using chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$location = Split-Path -parent $MyInvocation.MyCommand.Path
choco install visualstudio2019enterprise --package-parameters="--config $location\.vsconfig" -y
choco install $location\choco-packages.config -y

echo "Installing module posh-git"
Install-Module posh-git -Confirm

echo "Installing WSL2 - part 1"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

echo "Enabling Windows containers" 
Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All -NoRestart

echo "Applying personal customisation"
cp $location\home\* $env:userprofile\ -force -r
git clone https://github.com/dvdvorle/vimfiles.git $env:userprofile\.vim

cp $location\ConEmu.xml C:\tools\cmder\vendor\conemu-maximus5\ConEmu.xml -Force

echo "Patching the weird lambda thing in powershell in Cmder" 
$file = "C:\tools\Cmder\vendor\profile.ps1"
(cat $file -raw) -replace "λ","$([char]0x03bb)" | set-content -path $file -encoding unicode

echo "Show taskbar buttons only on window it's open"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

echo "Remaining manual stuff:"
echo "- WSL2 install needs reboot, then provision2.ps1"

