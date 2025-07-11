#Valores de etiquetas comunes a todos los elementos
locals {
    Ambiente    = "QA"
    Nube        = "AWS"
    IaC         = "Terraform"
    Responsable = "Juan Perez"
    Fecha_Creacion = "12/07/2025"

    tags ={
        Ambiente    = local.Ambiente
        Nube        = local.Nube
        IaC         = local.IaC
        Responsable = local.Responsable
        Fecha_Creacion = local.Fecha_Creacion
    }
}