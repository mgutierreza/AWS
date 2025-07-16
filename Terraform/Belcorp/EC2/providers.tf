terraform {
  required_version = "~> 1.12.2" # Coincide con tu versión exacta

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # Versión compatible con Terraform 1.12.2
    }
  }
}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default" # Usa el perfil "default" que configuraste

  default_tags{
    tags = local.tags
  }
}