output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = values(aws_subnet.public)[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = values(aws_subnet.private)[*].id
}