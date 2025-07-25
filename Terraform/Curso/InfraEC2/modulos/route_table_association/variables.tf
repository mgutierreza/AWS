variable "rtb_id_public" {
  description = "ID del Route Table"
  type        = string
}

variable "rtb_id_private" {
  description = "ID del Route Table"
  type        = string
}

variable "pub_subnet_id" {
  description = "Identificadores de subredes públicas"
  type        = list(string)
}

variable "pri_subnet_id" {
  description = "Identificadores de subredes privadas"
  type        = list(string)
}