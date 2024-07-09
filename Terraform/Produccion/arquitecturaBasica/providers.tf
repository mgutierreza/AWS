terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.26"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "itera-test"
}

