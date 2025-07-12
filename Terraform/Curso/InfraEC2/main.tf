# Creación de la VPC
module "vpc" {
  source         = "./modulos/vpc"
  vpc_block_cidr = var.vpc_block_cidr
  vpc_name       = var.vpc_name
  enable_dns     = true

  tags = merge(var.tags, {
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
  source                = "./modulos/subnet"
  vpc_id                = module.vpc.vpc_id
  public_subnets_datos  = var.public_subnets_value
  private_subnets_datos = var.private_subnets_value
}

# Creación de Route Table y sus Asociaciones - Publico y Privado
module "routetable" {
  source = "./modulos/route_table"

  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id

  rtb_name_public  = "rtb-proyecto_public"
  rtb_name_private = "rtb-proyecto_private"
}

module "route_table_association" {
  source = "./modulos/route_table_association"

  rtb_id_public = module.routetable.rtb_id_public
  pub_subnet_id = module.subnet.public_subnet_ids

  pri_subnet_id  = module.subnet.private_subnet_ids
  rtb_id_private = module.routetable.rtb_id_private
}

# Creación de ACL
module "nacl" {
  source                     = "./modulos/nacl"
  
  vpc_default_network_acl_id = module.vpc.default_network_acl_id
  public_subnet_ids          = module.subnet.public_subnet_ids
  private_subnet_ids         = module.subnet.private_subnet_ids
  name_prefix                = "proyecto"
  tags                       = local.tags
  ingress_rules              = var.ingress_rules
  egress_rules               = var.egress_rules
}


