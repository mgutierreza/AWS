aws_region = "us-east-1"

//profile = "itera-test"

tags = {
  account        = "pe-xxxxx"
  region         = "us-east-1"
  description    = ""
  sponsor        = ""
  requester      = ""
  project        = "Ciclotron"
  application    = ""
  environment    = "PRD"
  createdBy      = "Manuel Gutiérrez Aguirre"
  ceco           = ""
  automatization = "terraform"
}

################################################################################
# VPC
################################################################################

  name = "VPC-CICLOTRON-PRD"
  cidr = "10.10.0.0/16"

################################################################################
# SUBNETS
################################################################################

  cidr_block ="0.0.0.0/0"
  nat_eip = "NGW-EIP-CICLOTRON-PRD"
  aws_network_acl = "NACL-CICLOTRON-PRD"
  
  azs1 = "us-east-1a"
  cidr_block_pub_1a = "10.10.1.0/24"
  name_pub_1a = "SUB-CICLOTRON-PRD-PUB-1A"
  aws_route_table_pub = "RT-CICLOTRON-PRD-PUB"

  cidr_block_pri_1a = "10.10.2.0/24"
  name_pri_1a = "SUB-CICLOTRON-PRD-PRI-1A"
  aws_route_table_pri = "RT-CICLOTRON-PRD-PRI"

  cidr_block_pri_2a = "10.10.3.0/24"
  name_pri_2a = "SUB-CICLOTRON-PRD-PRI-2A"
  //aws_route_table_pri_2a = "RT-CICLOTRON-PRD-PRI-2A"

  azs2 = "us-east-1b"
  cidr_block_pub_1b = "10.10.4.0/24"
  name_pub_1b = "SUB-CICLOTRON-PRD-PUB-1B"
  //aws_route_table_pub_1b = "RT-CICLOTRON-PRD-PUB-1B"

  cidr_block_pri_1b = "10.10.5.0/24"
  name_pri_1b = "SUB-CICLOTRON-PRD-PRI-1B"
  //aws_route_table_pri_1b = "RT-CICLOTRON-PRD-PRI-1B"

  cidr_block_pri_2b = "10.10.6.0/24"
  name_pri_2b = "SUB-CICLOTRON-PRD-PRI-2B"
  //aws_route_table_pri_2b = "RT-CICLOTRON-PRD-PRI-2B"

  aws_internet_gateway = "IGW-CICLOTRON-PRD"
  aws_nat_gateway = "NGW-CICLOTRON-PRD"

  default_security_group_name = "SG-CICLOTRON-PRD"

  role_name = "ec2-role"
