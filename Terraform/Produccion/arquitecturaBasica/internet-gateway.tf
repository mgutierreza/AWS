resource "aws_internet_gateway" "igw-terraform-onezone" {
    vpc_id =  aws_vpc.VPC-terraform-onezone.id
    tags = {
      Name = "igw-VPC-terraform-onezone"
    }
}

resource "aws_route_table" "route_table_principal" {
  vpc_id = aws_vpc.VPC-terraform-onezone.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-terraform-onezone.id
  }
  
  tags = {
    "Name" = "Public Route Table"
  }
}

resource "aws_route_table_association" "route_table_public_subnet" {
  subnet_id = aws_subnet.sn-pub-01-east-1a.id
  route_table_id = aws_route_table.route_table_principal.id
}