resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = var.vpc.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.aws_route_table[0]
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = module.aws_subnet.public_1a.id
  route_table_id = module.aws_route_table.public.id
  //network_acl_id = aws_network_acl.network_acl.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.public.id
}