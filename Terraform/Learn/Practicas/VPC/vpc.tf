resource "aws_vpc" "vpc_ueast_1_QA"{
    cidr_block = "10.10.0.0/16"
    tags = {
        Name = "VPC-Virgina-01"
        Descripcion = "Creación VPC con terraform"
        Fecha = "07/10/2024"
        Ambiente = "QA"
        Responsable = "MGA" 
    }
}

resource "aws_vpc" "vpc_ueast_2_QA"{
    cidr_block = "20.20.0.0/16"
    tags = {
        Name = "VPC-Ohio-01"
        Descripcion = "Creación VPC con terraform"
        Fecha = "07/10/2024"
        Ambiente = "QA"
        Responsable = "MGA" 
    }
    provider = aws.ohio
}