#!/bin/bash

# Script to install Terraform 

# Install software-properties-common
if (which software-properties-common)
then
  echo "software-properties-common is installed 👍"
else
  echo "Installing software-properties-common 👍 "
  sudo apt-get install -y software-properties-common
fi

# Check if gnupg is installed
if (dpkg -s gnupg)
then
  echo "gnupg is installed."
else
  echo "gnupg is not installed. Installing gnupg."
  sudo apt-get install -y gnupg
fi

if (gpg --no-default-keyring \
   --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \ --fingerprint | grep -q "$(wget -O- https://apt.releases.hashicorp.com/gpg | gpg --show-keys --fingerprint | grep -oP "([A-F0-9]{4}\s*){10}")")
then
   echo "HashiCorp GPG key fingerprint verified successfully"
else
   echo "HashiCorp GPG key fingerprint verification failed - downloading fresh key..."
   wget -O- https://apt.releases.hashicorp.com/gpg | \
   gpg --dearmor | \
   sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
fi

# Check if the HashiCorp repository file exists
if (stat /etc/apt/sources.list.d/hashicorp.list)
then
  echo "HashiCorp repository already exists at /etc/apt/sources.list.d/hashicorp.list."
else
  echo "HashiCorp repository not found. Adding repository."
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list && sudo apt update
fi

# Check if Terraform is installed
if (command -v terraform)
then
  echo "Terraform is already installed."
else
  echo "Terraform is not installed. Installing Terraform."
  sudo apt-get install -y terraform
fi

# Final Terraform installation verification
echo "Installation complete. Run 'terraform --version' to verify."
