module "my bucket"{
    source = "./modulos/s3"
    bucket_name = "almacen-privado-backups"
    lock_public_access = false
}