resource "aws_instance" "server-test" {
  ami                                  = var.ami_id
  instance_type                        = "t3.micro"
  subnet_id                            = var.subnet_id
  associate_public_ip_address          = true
  private_ip                           = var.ip-privada
  key_name                             = var.kp_name
  iam_instance_profile                 = aws_iam_instance_profile.ec2_profile.name
  security_groups                      = [var.sg_id]
  disable_api_termination              = true              # Protección contra eliminación
  instance_initiated_shutdown_behavior = "stop"            # Protección contra reinicio accidental

  root_block_device {
    volume_type = "gp3"
    volume_size = 20
  }

  user_data = <<-EOF
            #!/bin/bash
            yum update -y
            yum install -y httpd
            systemctl start httpd
            systemctl enable httpd
            echo "<h1>Bienvenidos desde $(hostname -f)</h1>" > /var/www/html/index.html
            EOF

  tags = {
    Name = var.server_name
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${"ec2-instance-profile-"}${var.ip-privada}"
  role = var.rol_name
}
