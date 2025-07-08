variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-2"
}

variable "tags" {
  description = "Etiquetas generales de componente AWS"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_block_cidr" {
  description = "CIDR block para la VPC"
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


