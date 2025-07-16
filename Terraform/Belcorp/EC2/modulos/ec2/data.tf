
## 1. Obtener VPC existente
data "aws_vpc" "vpc-server-test" {
  filter {
    name   = "tag:Name"
    values = ["vpc-server-test-vpc"]
  }
}

## 2. Obtener key pair existente
data "aws_key_pair" "existing_key" {
  key_name = "kp-server-test"
}

## 3. Obtener rol IAM existente
data "aws_iam_role" "existing_role" {
  name = "ec2-role"
}

## 4. Obtener AMI de Amazon Linux 2
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

