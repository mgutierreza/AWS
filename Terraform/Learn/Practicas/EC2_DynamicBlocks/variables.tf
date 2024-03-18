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

variable "instancias" {
  description = "Nombres de la instancia"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type        = bool
}

variable "sg_ingress_cird"{
  description = "Segmento de direcciones IP a considerar"
  type = string
}

variable "ingress_ports_list"{
  description = "Lista de puertos de ingresos"
  type = list(number)
}