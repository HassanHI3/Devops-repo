resource "aws_instance" "wordpress" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash

    dnf update -y || yum update -y

    dnf install -y httpd php php-mysqlnd mariadb105-server wget tar || \
    yum install -y httpd php php-mysqlnd mariadb-server wget tar

    systemctl enable httpd
    systemctl start httpd

    systemctl enable mariadb
    systemctl start mariadb

    cd /tmp
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz

    cp -r wordpress/* /var/www/html/

    chown -R apache:apache /var/www/html
    chmod -R 755 /var/www/html

    mysql -u root <<MYSQL_EOF
    CREATE DATABASE wordpress;
    CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'StrongPassword123!';
    GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
    FLUSH PRIVILEGES;
    MYSQL_EOF

    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php
    sed -i "s/username_here/wpuser/" /var/www/html/wp-config.php
    sed -i "s/password_here/StrongPassword123!/" /var/www/html/wp-config.php

    systemctl restart httpd
    EOF


  tags = {
    Name = "WordPress"
  }
}

resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress-sg"
  description = "Allow HTTP and SSH traffic"
}

resource "aws_security_group_rule" "wordpress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.wordpress_sg.id
  cidr_blocks       = [var.ip_address]
}

resource "aws_security_group_rule" "wordpress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.wordpress_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "wordpress_egress" {
  type              = "egress" # allow all outbound traffic
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # allow TCP, UDP, and ICMP and outbound traffic
  security_group_id = aws_security_group.wordpress_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}
