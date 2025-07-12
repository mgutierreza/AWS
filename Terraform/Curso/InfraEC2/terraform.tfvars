#Valores para VPC
vpc_name       = "vpc_proyecto_server"
vpc_block_cidr = "20.20.0.0/16"

#Valores para subnets
public_subnets_value = {
  "pub-subnet-1" = {
    cidr = "20.20.1.0/24",
    az   = "us-west-2a"
  },
  "pub-subnet-2" = {
    cidr = "20.20.4.0/24",
    az   = "us-west-2b"
  }
}

private_subnets_value = {
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

# Reglas para NACL
ingress_rules = [
  {
    rule_number = 100
    protocol    = "tcp"
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
  },
  {
    rule_number = 110
    protocol    = "tcp"
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
]

egress_rules = [
  {
    rule_number = 100
    protocol    = "-1"
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 0
    to_port     = 0
  }
]