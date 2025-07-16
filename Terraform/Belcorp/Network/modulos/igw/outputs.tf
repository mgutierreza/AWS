output "igw_id" {
  description = "ID del Internet Gateway creado"
  value       = aws_internet_gateway.this.id
}

output "igw_arn" {
  description = "ARN del Internet Gateway"
  value       = aws_internet_gateway.this.arn
}