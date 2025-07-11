output "bucket_name" {
  description = "Nombre del bucket S3 creado"
  value       = aws_s3_bucket.mybucket.bucket
}

output "bucket_arn" {
  description = "ARN del bucket S3 creado"
  value       = aws_s3_bucket.mybucket.arn
}

