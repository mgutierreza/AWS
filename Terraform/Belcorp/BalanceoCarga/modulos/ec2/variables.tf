variable "server_name" {
    description = "Nombre de la instancia EC2"
    type        = string
}

variable "kp_name" {
    description = "Nombre del keypair existente"
    type        = string
}

variable "ami_id" {
  description = "ID de la AMI a utilizar"
  type        = string
}

variable "rol_name" {
    description = "Nombre del rol IAM existente"
    type        = string
}

variable "subnet_id" {
  description = "ID de la subnet"
  type        = string
}

variable "sg_id" {
  description = "ID del grupo de seguridad"
  type        = string
}

variable "ip-privada" {
    description = "IP privada para la instancia"
    type        = string
}
