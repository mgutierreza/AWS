variable "function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "lambda_source_file" {
  description = "Ruta al archivo fuente de la Lambda"
  type        = string
}

variable "lambda_handler" {
  description = "Nombre del handler de la Lambda"
  type        = string
  default     = "handler.handler"
}

variable "runtime" {
  description = "Runtime de la Lambda"
  type        = string
  default     = "nodejs18.x"
}

variable "timeout" {
  description = "Timeout de la Lambda en segundos"
  type        = number
  default     = 10
}