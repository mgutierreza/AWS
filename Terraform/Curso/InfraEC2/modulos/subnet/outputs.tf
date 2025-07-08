/*
output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.subnet.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.subnet.private_subnet_ids
}

output "all_subnet_ids" {
  description = "IDs de todas las subredes"
  value       = merge(module.subnet.public_subnet_ids, module.subnet.private_subnet_ids)
}
*/