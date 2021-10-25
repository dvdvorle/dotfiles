git clone https://github.com/dvdvorle/vimfiles.git $env:userprofile\.vim --recurse-submodules

Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile .\wsl_update_x64.msi -UseBasicParsing
Start-Process msiexec.exe -ArgumentList "/i wsl_update_x64.msi /quiet" -Wait
rm .\wsl_update_x64.msi

wsl --set-default-version 2

Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile .\Ubuntu.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu.appx
rm .\Ubuntu.appx

echo "Remaining manual stuff:"
echo "- install Oracle SQL Developer (login with Oracle account)"
start 'https://www.oracle.com/tools/downloads/sqldev-downloads.html'
echo "- sqldeveloper connections import"
echo "- 7z as default zip application"
echo "- chrome as default browser" 
echo "- Visual Studio signin" 
echo "- Change font in outlook"
echo "- Restart docker desktop"
