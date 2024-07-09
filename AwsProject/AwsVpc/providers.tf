terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46"
    }
  }
}

provider "aws" {
  region  = var.aws_region //"us-east-1"
  profile = var.aws_profile //"itera-test"
}
