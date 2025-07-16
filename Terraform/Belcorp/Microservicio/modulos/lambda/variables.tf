variable "function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "api_gateway_execution_arn" {
  description = "ARN de ejecución del API Gateway"
  type        = string
}