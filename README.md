# Automating AWS EC2 Deployment from a VM  

## Overview  

This project aims to automate the creation of an Ubuntu virtual machine (VM) using Multipass on a local machine.
Inside this VM, the AWS Command Line Interface (CLI) will be installed and configured with AWS Single Sign-On (SSO). 
The AWS CLI will then be used to deploy an EC2 instance in AWS.  
---

## Project Goals  

- **Automate the setup** of an Ubuntu VM using Multipass on Mac, Windows, and Linux.  
- **Install and configure AWS CLI** within the VM.  
- **Authenticate using AWS SSO** instead of root credentials.  
- **Deploy an EC2 instance** from the VM using AWS CLI.  
- Ensure the process is **repeatable and scalable** with minimal manual intervention.  

---

## Steps  

1. **Set up the local environment**  
   - Install Multipass, Git, and Nano on Mac, Windows, and Linux.  
   - Create scripts to automate this setup for each OS.  

2. **Create an Ubuntu VM using Multipass**  
   - Launch an Ubuntu instance using a predefined script.  

3. **Install AWS CLI inside the VM**  
   - Automate the installation of AWS CLI.  

4. **Configure AWS authentication**  
   - Set up AWS Identity Center (SSO).  
   - Create an IAM user with administrator access.  
   - Authenticate via `aws configure sso`.  

5. **Deploy an EC2 instance from the VM**  
   - Automate instance creation using the AWS CLI.  
   - Configure security groups, key pairs, and other required settings.  

6. **Validate and test the deployment**  
   - Ensure the EC2 instance is running and accessible.  
   - Verify AWS CLI commands work as expected.  

7. **Optimize and extend**  
   - Improve automation scripts for efficiency.  
   - Explore additional AWS services that can be managed from the VM.  

---
## Project Commands

### Starting the Project

#### On macOS:
Run the following command to start the project on a Mac:

Run the following commaand to start the project on Linux: 

### Starting the VM
Run the following command to create the vm:
