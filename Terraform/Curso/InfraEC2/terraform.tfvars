#Valores para VPC
vpc_name   = "vpc_proyecto_server"
vpc_block_cidr   = "20.20.0.0/16"

#Valores para subnets
public_subnets_block_cidr = {
  "pub-subnet-1" = {
    cidr = "20.20.1.0/24",
    az   = "us-west-2a"
  },
  "pub-subnet-2" = {
    cidr = "20.20.4.0/24",
    az   = "us-west-2b"
  }
}

private_subnets_block_cidr = {
  "priv-subnet-1" = {
    cidr = "20.20.2.0/24",
    az   = "us-west-2a"
  },
  "priv-subnet-2" = {
    cidr = "20.20.3.0/24",
    az   = "us-west-2a"
  },
  "priv-subnet-3" = {
    cidr = "20.20.5.0/24",
    az   = "us-west-2b"
  },
  "priv-subnet-4" = {
    cidr = "20.20.6.0/24",
    az   = "us-west-2b"
  }
}

/*
#Valores para network ACL
nacl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
  },
  {
    rule_no    = 110
    action     = "allow"
    from_port  = 443
    to_port    = 443
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
  }
]

nacl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }
]
*/