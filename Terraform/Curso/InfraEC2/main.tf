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

module "subnet" {
  source         = "./modulos/subnet"
  vpc_id         = aws_vpc.vpc_proyecto_server.vpc_id
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets

  tags = merge(var.tags,{
    Name = var.vpc_name
    CIDR = var.vpc_block_cidr
  })

}




