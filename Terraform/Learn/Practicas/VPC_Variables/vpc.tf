resource "aws_vpc" "vpc_ueast_1_QA"{
    cidr_block = var.Virginia_cidr
    tags = {
        Name = var.map_tags_virginia_01["Name"]
        Descripcion = var.map_tags_virginia_01["Descripcion"]
        Fecha = var.map_tags_virginia_01["Fecha"]
        Ambiente = var.map_tags_virginia_01["Ambiente"]
        Responsable = var.map_tags_virginia_01["Responsable"] 
    }
    provider = aws.virginia
}

resource "aws_vpc" "vpc_ueast_2_QA"{
    cidr_block = var.Ohio_cidr
    tags = {
        Name = var.map_tags_ohio_01["Name"]
        Descripcion = var.map_tags_ohio_01["Descripcion"]
        Fecha = var.map_tags_ohio_01["Fecha"]
        Ambiente = var.map_tags_ohio_01["Ambiente"]
        Responsable = var.map_tags_ohio_01["Responsable"] 
    }
    provider = aws.ohio
}