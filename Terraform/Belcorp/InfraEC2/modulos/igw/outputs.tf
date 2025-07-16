output "igw_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.igw-proyecto.id
}

output "igw_arn" {
  description = "ARN del Internet Gateway"
  value       = aws_internet_gateway.igw-proyecto.arn
}