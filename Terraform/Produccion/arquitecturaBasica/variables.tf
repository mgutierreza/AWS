variable "vpc_01_cird" {
  description = "CIDR Virginia"
  type        = string
  sensitive   = false
}

variable "tags" {
  description = "Tags generales de los servicios"
  type        = map(string)
}

variable "rango_public_subnet_01" {
  description = "CIDR Public Subnet"
  type        = string
}

variable "rango_private_subnet_01" {
  description = "CIDR Private Subnet"
  type        = string
}

variable "rango_private_subnet_02" {
  description = "CIDR Private Subnet"
  type        = string
}

variable "AZ_01"{
  description = "Zona de Disponibilidad"
  type = string
}

