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

# Check if the keyring file exists
if (stat /usr/share/keyrings/hashicorp-archive-keyring.gpg)
then
  echo "HashiCorp GPG key already exists at /usr/share/keyrings/hashicorp-archive-keyring.gpg."
else
  echo "HashiCorp GPG key not found. Adding HashiCorp GPG key."
  wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
fi

# Check that the fingerprint is verified
if (gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint)
then 
  echo 'The keys fingerprint is verified'
else 
  echo 'the fingerprint is not verified, lets try again to get it right my dude!'
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
