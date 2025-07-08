output "vpc_id" {
  description = "ID de la VPC creada"
  value       = this.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block de la VPC"
  value       = this.vpc_block_cidr
}
