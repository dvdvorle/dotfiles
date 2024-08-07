#Requires -RunAsAdministrator

echo "Install software using chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$location = Split-Path -parent $MyInvocation.MyCommand.Path
choco install $location\choco-packages.config -y

echo "Installing module posh-git"
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module posh-git

echo "Installing WSL2 - part 1"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

echo "Enabling Windows containers" 
Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All -NoRestart

echo "Applying personal customisation"
cp $location\home\* $env:userprofile\ -force -r

echo "Show taskbar buttons only on window it's open"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

echo "Remove taskbar Widget on W11"
Get-AppxPackage *WebExperience* | Remove-AppxPackage

Unblock-File $location\provision2.ps1
New-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce MyKey -propertytype String -value "Powershell -NoExit $location\provision2.ps1"
Restart-Computer
