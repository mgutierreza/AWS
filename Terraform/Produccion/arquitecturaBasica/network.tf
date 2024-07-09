resource "aws_vpc" "VPC-terraform-onezone" {
  cidr_block = var.vpc_01_cird

}

resource "aws_subnet" "sn-pub-01-east-1a" {
  vpc_id                  = aws_vpc.VPC-terraform-onezone.id
  cidr_block              = var.rango_public_subnet_01
  availability_zone       = var.AZ_01
  map_public_ip_on_launch = true

}

resource "aws_subnet" "sn-pri-01-east-1a" {
  vpc_id                  = aws_vpc.VPC-terraform-onezone.id
  cidr_block              = var.rango_private_subnet_01
  availability_zone       = var.AZ_01

}

resource "aws_subnet" "sn-pri-02-east-1a" {
  vpc_id                  = aws_vpc.VPC-terraform-onezone.id
  cidr_block              = var.rango_private_subnet_02
  availability_zone       = var.AZ_01

}