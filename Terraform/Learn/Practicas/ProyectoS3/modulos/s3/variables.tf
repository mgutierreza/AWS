variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "block_public_access" {
  description = "Configuración para bloquear el acceso público al bucket"
  type        = bool
}