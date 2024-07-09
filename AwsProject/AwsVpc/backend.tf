terraform {
  backend "s3" {
    encrypt = true
    bucket = "manuelg-terraform" 
    key    = "terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "itera-aws-terraform"
    profile = "itera-test"
  }
}