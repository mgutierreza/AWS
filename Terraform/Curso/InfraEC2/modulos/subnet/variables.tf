variable "tags" {
  description = "Etiquetas generales de componente AWS"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "public_subnets" {
  description = "Mapa de subredes públicas"
  type        = map(map(string))
}

variable "private_subnets" {
  description = "Mapa de subredes privadas"
  type        = map(map(string))
}