**Domain + EC2 + DNS (NGINX) Lab**

**Overview:**
This project demonstrates deploying a basic web server on AWS EC2 and connecting it to a custom domain using DNS.
The goal was to understand how IP addresses, ports, DNS, and routing work together to serve a website over the internet.

**What I Built**:

- Purchased and configured a custom domain using Cloudflare
- Launched an AWS EC2 instance running Ubuntu
- Installed and configured NGINX as a web server
- Configured EC2 security groups to allow: SSH (port 22) for secure access , HTTP (port 80) for web traffic
- Created DNS A records pointing the domain to the EC2 public IP
- Verified the website loads successfully via: EC2 public IPv4 address


**Custom domain name**:
Architecture: Browser → DNS (Cloudflare) → EC2 Public IP → NGINX (Port 80)


**What I Learned**:
- How DNS A records resolve domain names to IP addresses
- How inbound traffic is controlled using EC2 security groups
- The role of ports in networking (SSH on 22, HTTP on 80)
- How web traffic flows from a browser to a server over the internet
- How to deploy and manage a basic Linux web server on AWS
- How DNS propagation affects access timing when updating records
- How to document infrastructure work clearly for a DevOps portfolio

**Challenges and How I Solved Them**:

1. The NGINX page did not load in the browser after installation.

Solution:
I identified that HTTP (port 80) was not enabled in the EC2 security group.
After adding an inbound rule allowing HTTP traffic from anywhere, the site loaded correctly.

2. The domain did not resolve to the EC2 instance straight away.

Solution:
I verified the A record was pointing to the correct public IP and waited for DNS propagation.
I also ensured Cloudflare proxying was disabled (DNS only).

3. Screenshots were initially uploaded to the wrong directory.

Solution:
I reorganised the repository by creating a dedicated screenshots/ folder and moving files into it using GitHub’s rename functionality, ensuring a clean and professional structure.




**Evidence**:
- Screenshots showing each step of the setup and verification process are available in the screenshots/ directory.

**Final Result**:
- The NGINX default page successfully loads when visiting the custom domain, proving that the domain, DNS configuration, EC2 instance, and web server are all correctly connected.

