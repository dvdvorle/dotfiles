#Requires -RunAsAdministrator

echo "Setting the TNS_ADMIN variable"
[System.Environment]::SetEnvironmentVariable('TNS_ADMIN','V:\',[System.EnvironmentVariableTarget]::Machine)

echo "Install software using chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$location = Split-Path -parent $MyInvocation.MyCommand.Path
choco install visualstudio2019enterprise --package-parameters="--config $location\.vsconfig" -y
choco install $location\choco-packages.config -y

echo "Installing module posh-git"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module posh-git

echo "Enabling Windows containers" 
Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All -NoRestart

echo "Applying personal customisation"
cp $location\home\* $env:userprofile\ -force -r
git clone https://github.com/dvdvorle/vimfiles.git $env:userprofile\.vim

echo "Show taskbar buttons only on window it's open"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

Restart-Computer
