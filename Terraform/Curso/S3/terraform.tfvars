aws_region          = "us-east-1"
bucket_name         = "almacen-privado-backups"
block_public_access = false

tags = {
  "Ambiente"    = "PRD"
  "Nube"        = "AWS"
  "IaC"         = "Terraform"
  "Responsable" = "Juan Perez"
  "Fecha Creacion" = "25/06/2025"
}
