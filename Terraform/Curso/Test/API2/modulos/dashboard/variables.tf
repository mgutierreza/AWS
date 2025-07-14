variable "api_name" {
  description = "Nombre del API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Nombre del stage"
  type        = string
  default     = "dev"
}

variable "log_retention_days" {
  description = "Días de retención de logs"
  type        = number
  default     = 7
}

variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-2"
}