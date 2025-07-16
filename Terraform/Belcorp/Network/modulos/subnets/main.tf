resource "aws_subnet" "subnet-public-1a" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet-cidr.public_cidr_1A
  availability_zone = var.availabilityzone.azs1
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_subnet.name_public_1A
  }
}

resource "aws_subnet" "subnet-public-2a" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet-cidr.public_cidr_2A
  availability_zone = var.availabilityzone.azs2
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_subnet.name_public_2A
  }
}

resource "aws_subnet" "subnet-private-1a" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet-cidr.private_cidr_1A
  availability_zone = var.availabilityzone.azs1
  
  tags = {
    Name = var.name_subnet.name_private_1A
  }
}

resource "aws_subnet" "subnet-private-2a" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet-cidr.private_cidr_2A
  availability_zone = var.availabilityzone.azs1
  
  tags = {
    Name = var.name_subnet.name_private_2A
  }
}

resource "aws_subnet" "subnet-private-1b" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet-cidr.private_cidr_1B
  availability_zone = var.availabilityzone.azs1
  
  tags = {
    Name = var.name_subnet.name_private_1B
  }
}

resource "aws_subnet" "subnet-private-2b" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet-cidr.private_cidr_2B
  availability_zone = var.availabilityzone.azs1
  
  tags = {
    Name = var.name_subnet.name_private_2B
  }
}
