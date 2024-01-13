resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc_ueast_1_QA.id
    cidr_block = var.public_subnet
    map_public_ip_on_launch = true
    tags = {
        Name = var.map_tags_subnet_virginia_01["Name"]
        Descripcion = var.map_tags_subnet_virginia_01["Descripcion"]
        Fecha = var.map_tags_subnet_virginia_01["Fecha"]
        Ambiente = var.map_tags_subnet_virginia_01["Ambiente"]
        Responsable = var.map_tags_subnet_virginia_01["Responsable"] 
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc_ueast_1_QA.id
    cidr_block = var.private_subnet  
    tags = {
        Name = var.map_tags_subnet_virginia_01["Name"]
        Descripcion = var.map_tags_subnet_virginia_01["Descripcion"]
        Fecha = var.map_tags_subnet_virginia_01["Fecha"]
        Ambiente = var.map_tags_subnet_virginia_01["Ambiente"]
        Responsable = var.map_tags_subnet_virginia_01["Responsable"] 
    }
}