### Assignment 1 - VPC & Networking
### Overview

Built a custom AWS VPC from scratch to learn networking, routing, and subnet segmentation.

### Objective

Create a custom VPC with one public and one private subnet, set up internet access, and deploy EC2 instances in both.

### Tasks
1. VPC

- Custom VPC: 10.0.0.0/16  [x] 
- One public subnet  [x] 
- One private subnet  [x] 

2. Internet Access

- Created and attached an Internet Gateway
- Allocated an Elastic IP
- Created a NAT Gateway in the public subnet

3. Route Tables

- Public route table → default route to Internet Gateway
- Private route table → default route to NAT Gateway

4. EC2 Instances

- Public EC2 in public subnet with public IP
- Private EC2 in private subnet without public IP

5. Security

- Public EC2 security group: SSH/HTTP only from my IP
- Private EC2 security group: internal access only

Bonus

Bastion Host for private EC2 access

CloudWatch monitoring enabled

Outcome

This setup allows the public EC2 to be reachable from the internet while keeping the private EC2 isolated. The private subnet can still access the internet outbound through the NAT Gateway.

