resource "aws_vpc" "vpc_proyecto" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  # region = var.region

  tags = {
    Name = var.vpc_name
    cidr = var.vpc_cidr
  }
}