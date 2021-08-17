#!/bin/bash

# Remount disks to prevent https://askubuntu.com/questions/1115564/wsl-ubuntu-distro-how-to-solve-operation-not-permitted-on-cloning-repository
# This is why this script needs to run from $HOME
umount /mnt/c
mount -t drvfs C: /mnt/c -o metadata

umount /mnt/d
mount -t drvfs D: /mnt/d -o metadata


# Install Git Credential Manager Core
curl -L https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v2.0.475/gcmcore-linux_amd64.2.0.475.64295.deb --output gcmcore-linux_amd64.deb
dpkg -i gcmcore-linux_amd64.deb
git-credential-manager-core configure

# Configure GCM
git config --global --replace-all credential.https://dev.azure.com.usehttppath true
git config --global credential.credentialStore cache

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
