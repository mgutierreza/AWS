variable "api_name" {
  description = "Nombre del API Gateway"
  type        = string
}

variable "api_description" {
  description = "Descripción del API Gateway"
  type        = string
  default     = "API Gateway creado con Terraform"
}

variable "resource_path" {
  description = "Path del recurso"
  type        = string
  default     = "greeting"
}

variable "http_method" {
  description = "Método HTTP"
  type        = string
  default     = "GET"
}

variable "authorization" {
  description = "Tipo de autorización"
  type        = string
  default     = "NONE"
}

variable "lambda_invoke_arn" {
  description = "ARN de invocación de la Lambda"
  type        = string
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "stage_name" {
  description = "Nombre del stage"
  type        = string
  default     = "dev"
}