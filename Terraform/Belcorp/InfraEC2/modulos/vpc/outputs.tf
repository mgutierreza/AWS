output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.vpc_proyecto_server.id
}

output "vpc_cidr" {
  description = "CIDR block de la VPC"
  value       = aws_vpc.vpc_proyecto_server.cidr_block
}

output "default_network_acl_id" {
  value = aws_vpc.vpc_proyecto_server.default_network_acl_id
}