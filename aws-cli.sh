# AWS CLI should be installed
aws --version

# gpg should be installed
gpg --version

# AWS CLI public key should be saved to a file named awscliv2.gpg
# (manually paste the public key block into a file named awscliv2.gpg)

# AWS CLI public key should be imported
gpg --import awscliv2.gpg

# curl should be installed
curl

# AWS CLI zip file should be downloaded to /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"

# AWS CLI signature file should be downloaded to /tmp
curl -o /tmp/awscliv2.sig https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip.sig

# Signature of AWS CLI zip file should be verified
gpg --verify /tmp/awscliv2.sig /tmp/awscliv2.zip

# unzip should be installed
unzip

# AWS CLI zip file should be unzipped to /tmp/aws
unzip /tmp/awscliv2.zip -d /tmp

# AWS CLI install script should exist in /tmp/aws
ls /tmp/aws/install

# AWS CLI should be installed in /usr/local/aws-cli
ls /usr/local/aws-cli

# AWS CLI symlink should exist at /usr/local/bin/aws
ls -l /usr/local/bin/aws

# AWS CLI should be installed
aws --version
