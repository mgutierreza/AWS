resource "aws_vpc" "vpc_proyecto_server" {
  cidr_block           = var.vpc_block_cidr
  enable_dns_support   = var.enable_dns
  enable_dns_hostnames = var.enable_dns

  tags = {
    Name = var.vpc_name
    cidr = var.vpc_block_cidr
  }
}

