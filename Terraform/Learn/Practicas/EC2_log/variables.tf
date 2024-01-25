variable "Virginia_cidr" {
  description = "CIDR Virginia"
  type        = string
  sensitive   = false
}

variable "tags" {
  description = "Tags generales de los servicios"
  type        = map(string)
}

variable "public_subnet" {
  description = "CIDR Public Subnet"
  type        = string
}

variable "private_subnet" {
  description = "CIDR Private Subnet"
  type        = string
}

variable "ec2_parametros" {
  description = "Parémetros de la instancia"
  type        = map(string)
}