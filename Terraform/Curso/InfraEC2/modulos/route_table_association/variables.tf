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
  type        = map(map(string))
}

variable "pri_subnet_id" {
  description = "Identificadores de subredes privadas"
  type        = map(map(string))
}