resource "aws_s3_bucket" "private_backups" {
  bucket = var.bucket_name
  tags   = merge(
    var.tags,
    {
      "Nombre" = var.bucket_name
    }
  )
}

resource "aws_s3_bucket_public_access_block" "private_backups" {

  bucket = aws_s3_bucket.private_backups.id

  block_public_acls       = var.block_public_access
  block_public_policy     = var.block_public_access
  ignore_public_acls      = var.block_public_access
  restrict_public_buckets = var.block_public_access
}

resource "aws_s3_bucket_server_side_encryption_configuration" "private_backups" {
  bucket = aws_s3_bucket.private_backups.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "private_backups" {
  bucket = aws_s3_bucket.private_backups.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
