#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Bienvenidos al laboratorio de Terraform desde  $(hostname -f)</h1>" > /var/www/html/index.html
