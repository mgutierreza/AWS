resource "aws_vpc" "vpc_ueast_1_QA" {
  cidr_block = var.Virginia_cidr
  provider   = aws.virginia
  tags = {
    "Name"           = "VPC_Easts_01"
    "Fecha Creacion" = "12/01/2024"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_ueast_1_QA.id
  cidr_block              = var.public_subnet
  map_public_ip_on_launch = true
  tags = {
    "Name"           = "vPC_Easts_01_subnet_public_01"
    "Fecha Creacion" = "12/01/2024"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_ueast_1_QA.id
  cidr_block = var.private_subnet
  tags = {
    "Name"           = "vPC_Easts_01_subnet_private_01"
    "Fecha Creacion" = "12/01/2024"
  }
  depends_on = [
    aws_instance.public_instance
  ]

}