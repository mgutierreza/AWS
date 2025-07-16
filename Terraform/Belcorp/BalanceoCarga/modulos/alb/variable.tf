variable "alb_name" {
  description = "Nombre del balanceador de carga (ALB)"
  type        = string
}

variable "vpc_id" {
  description = "ID del VPC donde se desplegará el ALB"
  type        = string
}

variable "sg_id" {
  description = "ID del grupo de seguridad para el ALB"
  type        = string
}

variable "target_group_arn" {
  description = "ARN del Target Group para las instancias EC2"
  type        = list(string)
}

variable "public_subnets_id" {
  description = "IDs de las subnets públicas para el ALB"
  type        = list(string)
}

variable "instance_ids" {  # Mejor nombre que "target_group_arn"
  type        = list(string)
  description = "Lista de IDs de instancias EC2 para registrar en el Target Group"
}