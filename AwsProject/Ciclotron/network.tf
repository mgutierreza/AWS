#######
# VPC #
#######

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr
  tags = var.tags

}

##########
# SUBNET #
##########

resource "aws_subnet" "public-1a" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.cidr_block_pub_1a
  availability_zone = var.azs1  # Cambia a la zona de disponibilidad deseada
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_pub_1a
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.cidr_block_pub_1b
  availability_zone = var.azs2  # Cambia a la zona de disponibilidad deseada
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_pub_1b
  }
}

resource "aws_subnet" "private-1a" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.cidr_block_pri_1a
  availability_zone = var.azs1  # Cambia a la zona de disponibilidad deseada

  tags = {
    Name = var.name_pri_1a
  }
}

resource "aws_subnet" "private-2a" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.cidr_block_pri_2a
  availability_zone = var.azs1  # Cambia a la zona de disponibilidad deseada

  tags = {
    Name = var.name_pri_2a
  }
}

resource "aws_subnet" "private-1b" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.cidr_block_pri_1b
  availability_zone = var.azs2  # Cambia a la zona de disponibilidad deseada

  tags = {
    Name = var.name_pri_1b
  }
}

resource "aws_subnet" "private-2b" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.cidr_block_pri_2b
  availability_zone = var.azs2  # Cambia a la zona de disponibilidad deseada

  tags = {
    Name = var.name_pri_2b
  }
}

####################
# INTERNET GATEWAY #
####################

resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = var.aws_internet_gateway
  }
}

######################
# ROUTE TABLE PUBLIC #
######################

resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.aws_route_table_pub
  }
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.public.id
  //network_acl_id = aws_network_acl.network_acl.id
}


resource "aws_route_table_association" "public-1b" {
  subnet_id      = aws_subnet.public-1b.id
  route_table_id = aws_route_table.public.id
}

##############
# ELASTIC IP #
##############

resource "aws_eip" "nat_eip" {
  tags = {
    Name = var.nat_eip
  }
}

###############
# NAT GATEWAY #
###############

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public-1a.id

  tags = {
    Name = var.aws_nat_gateway
  }
}

#######################
# ROUTE TABLE PRIVATE #
#######################

resource "aws_route_table" "private" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = var.cidr_block
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = var.aws_route_table_pri
  }
}

resource "aws_route_table_association" "private-1a" {
  subnet_id      = aws_subnet.private-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-2a" {
  subnet_id      = aws_subnet.private-2a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-1b" {
  subnet_id      = aws_subnet.private-1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-2b" {
  subnet_id      = aws_subnet.private-2b.id
  route_table_id = aws_route_table.private.id
}
