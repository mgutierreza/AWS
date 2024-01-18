
resource "aws_instance" "public_instance" {
    ami = "ami-0a749d160bf052e89"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
}