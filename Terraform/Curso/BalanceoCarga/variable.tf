variable "aws_region" {
  description = "Región de AWS"
  type        = string
}

variable "instance_configuration" {
  description = "Configuración de la instancia EC2"
  type = list(object({
    subnet_id   = string
    ip_privada  = string
  }))
  
}