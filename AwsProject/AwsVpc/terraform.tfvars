aws_region = "us-east-1"

//profile = "itera-test"

tags = {
  account        = "pe-mx-auna-oca-app-hospital-qas"
  region         = "us-east-1"
  description    = ""
  sponsor        = ""
  requester      = ""
  project        = ""
  application    = ""
  environment    = ""
  createdBy      = "Wilfredo Dueñas Vallejo"
  ceco           = ""
  automatization = "terraform"
}

################################################################################
# VPC
################################################################################

  name = "VPC-HOSPITAL-QAS"
  cidr = "172.21.4.0/23"

################################################################################
# SUBNETS
################################################################################

  cidr_block ="0.0.0.0/0"
  nat_eip = "NGW-EIP-HOSPITAL-QAS"
  aws_network_acl = "NACL-HOSPITAL-QAS"
  
  azs1 = "us-east-1a"
  cidr_block_pub_1a = "172.21.4.0/25"
  name_pub_1a = "SUB-HOSPITAL-QAS-PUB-1A"
  aws_route_table_pub = "RT-HOSPITAL-QAS-PUB"

  cidr_block_pri_1a = "172.21.5.0/26"
  name_pri_1a = "SUB-HOSPITAL-QAS-PRI-1A"
  aws_route_table_pri = "RT-HOSPITAL-QAS-PRI"

  cidr_block_pri_2a = "172.21.5.128/26"
  name_pri_2a = "SUB-HOSPITAL-QAS-PRI-2A"
  //aws_route_table_pri_2a = "RT-HOSPITAL-QAS-PRI-2A"

  azs2 = "us-east-1b"
  cidr_block_pub_1b = "172.21.4.128/25"
  name_pub_1b = "SUB-HOSPITAL-QAS-PUB-1B"
  //aws_route_table_pub_1b = "RT-HOSPITAL-QAS-PUB-1B"

  cidr_block_pri_1b = "172.21.5.64/26"
  name_pri_1b = "SUB-HOSPITAL-QAS-PRI-1B"
  //aws_route_table_pri_1b = "RT-HOSPITAL-QAS-PRI-1B"

  cidr_block_pri_2b = "172.21.5.192/26"
  name_pri_2b = "SUB-HOSPITAL-QAS-PRI-2B"
  //aws_route_table_pri_2b = "RT-HOSPITAL-QAS-PRI-2B"

  aws_internet_gateway = "IGW-HOSPITAL-QAS"
  aws_nat_gateway = "NGW-HOSPITAL-QAS"