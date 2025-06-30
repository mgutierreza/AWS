variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
  default     = "almacen-privado-backups"
}

variable "block_public_access" {
  description = "Configuración para bloquear el acceso público al bucket"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Etiquetas generales del componente AWS"
  type        = map(string)
  default     = {}
}