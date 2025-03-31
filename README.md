# Apache Web Server Deployment on AWS EC2

This repository contains Terraform scripts and Ansible playbooks for automating the deployment of an Apache web server on an AWS EC2 instance.

## Overview

This project demonstrates Infrastructure-as-Code (IaC) principles by using Terraform to provision an EC2 instance and Ansible to configure and deploy an Apache web application stack.

## Technologies Used

* **Terraform:** For provisioning the AWS EC2 instance and related infrastructure.
* **Ansible:** For automating the installation, configuration, and deployment of the Apache web server.
* **AWS EC2:** For hosting the web server.
* **Git:** For version control.

## Prerequisites

Before you begin, ensure you have the following installed and configured:

* **AWS CLI:** Configured with your AWS credentials.
* **Terraform:** Installed and configured.
* **Ansible:** Installed and configured.
* **Git:** Installed and configured.
* An AWS account.
* An SSH key pair for accessing the EC2 instance.

## Getting Started

1.  **Clone the Repository:**

    ```bash
    git clone [https://github.com/krithikakartik17/Apache-Web-Server.git](https://www.google.com/search?q=https://github.com/krithikakartik17/Apache-Web-Server.git)
    cd Apache-Web-Server
    ```

2.  **Terraform Deployment:**

    * Initialize Terraform:

        ```bash
        terraform init
        ```

    * Apply the Terraform configuration:

        ```bash
        terraform apply
        ```

    * This will create an EC2 instance. You can view the public IP address of your EC2 instance on AWS Console.

3.  **Ansible Deployment:**

    * Update the Ansible inventory file (`hosts`) with the public IP address of your EC2 instance.
    * Ensure your SSH private key path is correct in the `hosts` file.
    * Run the Ansible playbook:

        ```bash
        ansible-playbook -i hosts install_apache.yml
        ```

    * This will install and configure Apache on the EC2 instance and deploy a basic `index.html` file.

4.  **Access the Web Server:**

    * Open a web browser and navigate to the public IP address of your EC2 instance.

