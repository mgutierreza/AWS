variable "Virginia_cidr" {
    description = "CIDR Virginia"
    type = string
    sensitive = false
}

variable "map_tags_vpc_virginia_01" {
    default = {
        "Name" = "VPC-Virgina-01"
        "Descripcion" = "Creación VPC con terraform"
        "Fecha" = "07/10/2024"
        "Ambiente" = "QA"
        "Responsable" = "MGA" 
    }
    type = map(string)
}

variable "public_subnet" {
    description = "CIDR Public Subnet"
    type = string
}

variable "private_subnet" {
    description = "CIDR Private Subnet"
    type = string
}

variable "map_tags_subnet_virginia_01" {
    default = {
        "Name" = "subnet-Virginia-01"
        "Descripcion" = "Creación Subnet con terraform"
        "Fecha" = "12/10/2024"
        "Ambiente" = "QA"
        "Responsable" = "MGA" 
    }
    type = map(string)
}