resource "aws_instance" "public_instance" {
  ami           = var.ec2_parametros.ami
  instance_type = var.ec2_parametros.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = var.ec2_parametros.key_name
  vpc_security_group_ids = [aws_default_security_group.sg-access-itera-vpc.id]
  user_data = file("scripts/user-data.sh")

provisioner "local-exec" {
  command = "echo instancia creada con IP ${aws_instance.public_instance.public_ip}  >> datos_instancia.txt"
}

provisioner "local-exec" {
  when = destroy
  command = "echo instancia con IP ${self.public_ip} destruida >> datos_instancia.txt"
}

/* provisioner "remote-exec" {
  inline = [
    "echo 'Hola Mundo' > ~/saludo.txt"
  ]
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("test-mga.pem")
  }
  
}
Para generar terraform con log de ejecución:

PowerShell
> $env:TF_LOG="TRACE"
> $env:TF_LOG_PATH="logs/log.txt"

Bash
$ export TF_LOG="TRACE"
$ export TF_LOG_PATH="logs/log.txt"

 */

}