#Salida para VPC
output "vpn_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

#Salida para Internet Gateway
output "igw_id" {
  value = module.internet_gateway.igw_id
}

output "igw_arn" {
  value = module.internet_gateway.igw_arn
}

#Salida para subnets
output "public_subnet_ids" {
  value = module.subnet.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.subnet.private_subnet_ids
}

#Salida para NACL
output "nacl_id" {
  value = module.nacl.nacl_id
}

#Salida tablas de rutas
output "route_table_public" {
  value = module.routetable.rtb_id_public
}

output "route_table_private" {
  value = module.routetable.rtb_id_private
}
