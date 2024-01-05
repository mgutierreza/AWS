resource "aws_s3_bucket" "proveedores" {
    count = 6
    bucket = "proveedores-${random_string.sufijo[count.index].id}"  
    tags = {
        propietario = "MGA"
        ambiente = "DEV"
        objetivo = "Pruebas Terraform"
        fecha = "04/01/2024"
    }

}