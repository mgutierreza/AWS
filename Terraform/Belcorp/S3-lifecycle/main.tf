module "mybucket"{
    source = "./modulos/s3"
    bucket_name = "almacen-privado-backups"
    block_public_access = false
}