resource "aws_internet_gateway" "igw-proyecto" {
  
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}