variable "vpc_id" {
  type        = string
  description = "ID de la VPC"
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
  default = [
    {
      rule_number = 100
      protocol    = "tcp"
      action      = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
    },
    {
      rule_number = 110
      protocol    = "tcp"
      action      = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
    }
  ]
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
  default = [
    {
      rule_number = 100
      protocol    = "-1" 
      action      = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 0
      to_port     = 0
    }
  ]
}

variable "tags" {
  type        = map(string)
  description = "Etiquetas generales"
  default     = {}
}