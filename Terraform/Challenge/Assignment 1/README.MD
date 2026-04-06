# Assignment 1 - Deploy WordPress Using Terraform

## Overview
This project uses Terraform to deploy a WordPress site on AWS.
It provisions:
- an EC2 instance
- security groups
- user data to install WordPress and dependencies
- a public endpoint for access

## Files
- main.tf       # provider, EC2, security groups
- variables.tf  # input variables
- outputs.tf    # public IP / DNS outputs
- user-data.sh  # bootstrap script
- README.md     # project documentation

## Requirements
- Terraform installed
- AWS account
- AWS credentials configured
- valid key pair
- usable AMI ID and subnet/VPC values

## Deploy
- terraform init
- terraform fmt
- terraform validate
- terraform plan
- terraform apply

## Access
# After apply, open the public IP or DNS shown in the outputs:
- http://<public-ip>

## Destroy
terraform destroy

## What this project demonstrates
- Infrastructure as Code with Terraform
- EC2 provisioning on AWS
- security group configuration
- automated setup with user data
- end-to-end WordPress deployment
