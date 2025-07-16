variable "name_security_group" {
  description = "Nombre del grupo de seguridad"
  type        = string
}

variable "description_security_group" {
  description = "descripción del grupo de seguridad"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se creará el grupo de seguridad"
  type        = string
}

variable "name_security_group_alb" {
  description = "Nombre del grupo de seguridad del ALB"
  type        = string
}

variable "description_security_group_alb" {
  description = "descripción del grupo de seguridad del ALB"
  type        = string
}
