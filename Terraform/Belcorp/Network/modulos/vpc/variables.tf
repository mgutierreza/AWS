variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
}
