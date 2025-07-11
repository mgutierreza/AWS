# Creación de la VPN
module "vpc" {
  source     = "./modulos/vpc"
  vpc_block_cidr   = var.vpc_block_cidr
  vpc_name   = var.vpc_name
  enable_dns = true

  tags = merge(var.tags,{
    Name = var.vpc_name
    CIDR = var.vpc_block_cidr
  })

}

# Creación de Intenet Gateway
module "internet_gateway" {
  source = "./modulos/igw"

  vpc_id = module.vpc.vpc_id
  name   = "igw-proyecto"
}


# Creación de Subnets - Públicas y privadas
module "subnet" {
  source         = "./modulos/subnet"
  
  vpc_id         = module.vpc.vpc_id
  public_subnets = var.public_subnets_block_cidr
  private_subnets = var.private_subnets_block_cidr
}

# Creación de Route Table y sus Asociaciones - Publico y Privado
module "routetable" {
  source = "./modulos/route_table"

  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id

  rtb_name_public = "rtb-proyecto_public"
  rtb_name_private = "rtb-proyecto_private"   
}

module "routetable_association_private" {
  source = "./modulos/route_table_association/main_pri.tf"

  for_each       = module.subnet.private_subnet_ids
  rtb_id_private = module.routetable.rtb_id_private
  pri_subnet_id = each.value
}

module "routetable_association_public" {
  source = "./modulos/route_table_association/main_pub.tf"

  for_each       = module.subnet.public_subnet_ids
  rtb_id_public = module.routetable.rtb_id_public
  pub_subnet_id = each.value
}




# Creación de ACL
module "acl" {
  source  = "./modulos/nacl"

  vpc_id = module.vpc.vpc_id
}




