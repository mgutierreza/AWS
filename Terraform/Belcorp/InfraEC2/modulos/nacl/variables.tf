variable "vpc_default_network_acl_id" {
  type        = string
  description = "ID del NACL predeterminado de la VPC"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "IDs de las subnets públicas"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "IDs de las subnets privadas"
}

variable "name_prefix" {
  type        = string
  description = "Prefijo para el nombre del NACL"
  default     = "proyecto"
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

variable "tags" {
  type        = map(string)
  description = "Etiquetas generales"
  default     = {}
}