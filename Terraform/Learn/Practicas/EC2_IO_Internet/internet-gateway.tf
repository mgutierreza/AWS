resource "aws_internet_gateway" "igw" {
    vpc_id =  aws_vpc.vpc_ueast_1_QA.id
    tags = {
      Name = "igw vpc virginia"
    }
}

resource "aws_route_table" "route_table_principal" {
  vpc_id = aws_vpc.vpc_ueast_1_QA.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    "Name" = "Public Route Table"
  }
}

resource "aws_route_table_association" "route_table_public_subnet" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table_principal.id
}