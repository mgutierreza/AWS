resource "aws_s3_bucket_lifecycle_configuration" "backup_lifecycle" {
  bucket = aws_s3_bucket.private_backups.id

  rule {
    id     = "storage-transitions"
    status = "Enabled"

    # Transición a STANDARD_IA después de 30 días
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    # Transición a GLACIER después de 90 días (cumple mínimo 30+60)
    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    # Transición a DEEP_ARCHIVE después de 180 días (cumple mínimo 90+90)
    transition {
      days          = 180
      storage_class = "DEEP_ARCHIVE"
    }

    # Opcional: Expiración después de 2 años (730 días)
    expiration {
      days = 730
    }
  }
}