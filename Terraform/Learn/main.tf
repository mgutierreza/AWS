terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b2f2c807bbae79a6"
  instance_type = "t2.micro"
  
  network_interface {
    network_interface_id = "eni-080b9107f5c7925c2" 
    device_index         = 0
  }

  tags = {
    Name = "EC2-Terraform-ejemplo"
    Fecha_Creacion = "23/12/2023"
    Creada_Por = "Manuel Gutierrez"
    Motivo = "Pruebas Terraform"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}

