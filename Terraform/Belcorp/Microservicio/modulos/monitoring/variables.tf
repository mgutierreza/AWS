variable "api_name" {
  description = "Nombre del API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Nombre del stage (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region_monitoreo" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-2"
}

variable "alarm_actions" {
  description = "ARNs de acciones para alarmas (ej. SNS topics)"
  type        = list(string)
  default     = []
}