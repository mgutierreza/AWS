output "public_subnet_ids" {
  description = "Lista de subredes públicas con sus IDs"
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "Lista de nombres de subredes privadas con sus IDs"
  value = [for subnet in aws_subnet.private : subnet.id]
}

output "all_subnet_ids" {
  description = "Todos los IDs de subred en un solo mapa"
  value       = merge(
    { for k, v in aws_subnet.public : k => v.id },
    { for k, v in aws_subnet.private : k => v.id }
  )
}