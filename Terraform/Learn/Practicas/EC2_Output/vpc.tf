resource "aws_vpc" "vpc_ueast_1_QA"{
    cidr_block = var.Virginia_cidr
    provider = aws.virginia
    tags = {
        "Name" = "VPC_Easts_01"
        "Fecha Creacion" = "12/01/2024"
    }
}

