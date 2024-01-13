variable "Virginia_cidr" {}
variable "Ohio_cidr" {}

variable "map_tags_virginia_01" {
    default = {
        "Name" = "VPC-Virgina-01"
        "Descripcion" = "Creación VPC con terraform"
        "Fecha" = "07/10/2024"
        "Ambiente" = "QA"
        "Responsable" = "MGA" 
    }
    type = map(string)
}

variable "map_tags_ohio_01" {
    default = {
        "Name" = "VPC-Ohio-01"
        "Descripcion" = "Creación VPC con terraform"
        "Fecha" = "07/10/2024"
        "Ambiente" = "QA"
        "Responsable" = "MGA" 
    }
    type = map(string)
}