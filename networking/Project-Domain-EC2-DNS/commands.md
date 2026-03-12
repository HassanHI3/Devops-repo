# Commands Used

## Connect to EC2
ssh -i devops-nginx-key.pem ubuntu@18.207.136.92

## Install NGINX
sudo apt update -y

sudo apt install -y nginx

sudo systemctl start nginx

sudo systemctl enable nginx

## Verify
sudo systemctl status nginx

