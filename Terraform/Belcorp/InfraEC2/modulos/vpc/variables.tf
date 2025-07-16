variable "tags" {
  description = "Etiquetas generales de componente AWS"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_block_cidr" {
  description = "CIDR block para la VPC"
  type        = string
}

variable "enable_dns" {
  description = "Habilitar soporte DNS"
  type        = bool
  default     = true
}
