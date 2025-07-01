variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-2"
}

variable "tags" {
  description = "Etiquetas generales del componente AWS"
  type        = map(string)
  default     = {}
}
