#Valores de etiquetas comunes a todos los elementos
tags = {
  "Ambiente"    = "QA"
  "Nube"        = "AWS"
  "IAC"         = "Terraform"
  "Responsable" = "Juan Perez"
  "Fecha Creacion" = "12/07/2025"
}

#Valores para VPC
vpc_name   = "vpc_proyecto_server"
vpc_block_cidr   = "20.20.0.0/16"

#Valores para subnets
public_subnets = {
  "pub-subnet-1" = {
    cidr = "10.0.1.0/24",
    az   = "us-east-1a"
  },
  "pub-subnet-2" = {
    cidr = "10.0.2.0/24",
    az   = "us-east-1b"
  }
}

private_subnets = {
  "priv-subnet-1" = {
    cidr = "10.0.3.0/24",
    az   = "us-east-1a"
  },
  "priv-subnet-2" = {
    cidr = "10.0.4.0/24",
    az   = "us-east-1b"
  },
  "priv-subnet-3" = {
    cidr = "10.0.5.0/24",
    az   = "us-east-1a"
  },
  "priv-subnet-4" = {
    cidr = "10.0.6.0/24",
    az   = "us-east-1b"
  }
}