variable "api_name" {
  description = "Nombre del API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Nombre del stage (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "lambda_invoke_arn" {
  description = "ARN de invocación de la Lambda"
  type        = string
}

variable "logs_cloudwatch_arn" {
  description = "ARN del log group de CloudWatch"
  type        = string
}