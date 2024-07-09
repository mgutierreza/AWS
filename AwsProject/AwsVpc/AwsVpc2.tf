# provider "aws" {
#   region = "us-east-1"  # Cambia a la región que desees
# }

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_subnet" "public" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"  # Cambia a la zona de disponibilidad deseada
#   map_public_ip_on_launch = true
# }

# resource "aws_subnet" "private" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"  # Cambia a la zona de disponibilidad deseada
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id
# }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }
# }

# resource "aws_route_table_association" "public" {
#   subnet_id      = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }

# output "vpc_id" {
#   value = aws_vpc.main.id
# }

# output "public_subnet_id" {
#   value = aws_subnet.public.id
# }

# output "private_subnet_id" {
#   value = aws_subnet.private.id
# }




# provider "aws" {
#   region = "us-east-1"  # Cambia a la región que desees
# }

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_subnet" "public" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"  # Cambia a la zona de disponibilidad deseada
#   map_public_ip_on_launch = true
# }

# resource "aws_subnet" "private" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"  # Cambia a la zona de disponibilidad deseada
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id
# }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }
# }

# resource "aws_route_table_association" "public" {
#   subnet_id      = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_instance" "example" {
#   ami                    = "ami-0c55b159cbfafe1f0"  # ID de la AMI de la instancia EC2
#   instance_type          = "t2.micro"
#   subnet_id              = aws_subnet.public.id  # Asigna la instancia a la subnet pública
#   associate_public_ip_address = true
# }

# resource "aws_db_subnet_group" "example" {
#   name       = "example"
#   subnet_ids = [aws_subnet.private.id]  # Asigna la subnet privada al grupo de subnets de la base de datos
# }

# resource "aws_db_instance" "example" {
#   allocated_storage    = 20
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t2.micro"
#   name                 = "example"
#   username             = "admin"
#   password             = "password"
#   db_subnet_group_name = aws_db_subnet_group.example.name  # Asigna el grupo de subnets de la base de datos a la instancia RDS
# }
