module "mybucket" {
  source              = "./modulos/s3"
  bucket_name         = "almacen-privado-backups-2025"
  block_public_access = true
}