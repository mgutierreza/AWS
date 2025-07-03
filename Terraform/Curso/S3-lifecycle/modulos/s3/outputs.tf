output "bucket_arn" {
  description = "ARN del bucket S3 creado"
  value       = aws_s3_bucket.private_backups.arn
}

output "bucket_name" {
  description = "Nombre del bucket S3 creado"
  value       = aws_s3_bucket.private_backups.bucket
}

output "bucket_region" {
  description = "Región donde se creó el bucket"
  value       = aws_s3_bucket.private_backups.region
}

output "bucket_domain_name" {
  description = "Nombre de dominio del bucket"
  value       = aws_s3_bucket.private_backups.bucket_domain_name
}