/* 
resource "aws_instance" "public_instance" {
  count         = length(var.instancias)
  ami           = var.ec2_parametros.ami
  instance_type = var.ec2_parametros.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = var.ec2_parametros.key_name
  vpc_security_group_ids = [aws_default_security_group.sg-access-itera-vpc.id]
  user_data = file("scripts/user-data.sh")

  tags = {
    "Name" = var.instancias[count.index]
  }

} 
*/

resource "aws_instance" "public_instance" {
  for_each      = var.instancias
  ami           = var.ec2_parametros.ami
  instance_type = var.ec2_parametros.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = var.ec2_parametros.key_name
  vpc_security_group_ids = [aws_default_security_group.sg-access-itera-vpc.id]
  user_data = file("scripts/user-data.sh")

  tags = {
    "Name" = each.value
  }

} 