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
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets_value" {
  description = "Mapa de subredes privadas"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "ingress_rules" {
  type = list(object({
    rule_number = number
    protocol    = string
    action      = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
}

variable "egress_rules" {
  type = list(object({
    rule_number = number
    protocol    = string
    action      = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
}