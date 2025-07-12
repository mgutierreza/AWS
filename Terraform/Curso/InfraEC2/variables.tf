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

variable "public_subnets_value" {
  description = "Mapa de subredes publicas"
    type      = map(object({
                            cidr  = string
                            az    = string
                          }))
}

variable "private_subnets_value" {
  description = "Mapa de subredes privadas"
    type      = map(object({
                            cidr  = string
                            az    = string
                          }))
}

/*
variable "nacl_ingress_rules" {
  description = "Reglas de entrada para el Network ACL"
  type        = list(map(any))
  default     = []
}

variable "nacl_egress_rules" {
  description = "Reglas de salida para el Network ACL"
  type        = list(map(any))
  default     = []
}

*/