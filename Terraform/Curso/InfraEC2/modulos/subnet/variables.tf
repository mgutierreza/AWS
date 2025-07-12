variable "tags" {
  description = "Etiquetas generales de componente AWS"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "public_subnets_datos" {
  description = "Datos de subredes públicas"
    type      = map(object({
                            cidr  = string
                            az    = string
                          }))
}

variable "private_subnets_datos" {
  description = "Datos de subredes privadas"
    type      = map(object({
                            cidr  = string
                            az    = string
                          }))
}
