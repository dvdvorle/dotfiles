#!/bin/bash

# Remount disks to prevent https://askubuntu.com/questions/1115564/wsl-ubuntu-distro-how-to-solve-operation-not-permitted-on-cloning-repository
# This is why this script needs to run from $HOME
umount /mnt/c
mount -t drvfs C: /mnt/c -o metadata

umount /mnt/d
mount -t drvfs D: /mnt/d -o metadata

# Configure GCM
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install Helm
curl https://baltocdn.com/helm/signing.asc | apt-key add -
apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
apt-get update && apt-get install helm -y


# Install terraform
apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install terraform

# Install kubectl
az aks install-cli

# Prevent permission issues
rm -rf ~/.azure

# Install dotnet
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt-get install -y dotnet-sdk-3.1 dotnet-sdk-5.0
