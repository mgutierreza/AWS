resource "aws_instance" "server-test" {
	ami = data.aws_ami.amazon_linux.id
	instance_type = "t3.micro"
    subnet_id = var.subnet_id
    private_ip    = var.ip-privada
    key_name               = data.aws_key_pair.existing_key.key_name
    iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name    
    security_groups = [aws_security_group.server-test-security-group.id] 
    disable_api_termination = true # Protección contra eliminación
    instance_initiated_shutdown_behavior = "stop" # Protección contra reinicio accidental

    root_block_device {
        volume_type = "gp3"
        volume_size = 20 # Tamaño mínimo para Amazon Linux
    }

	#user_data = file("userdata/user-data-httpd.sh")
	user_data = file("${path.module}/userdata/user-data-httpd.sh")

	tags = {
		Name = "Server Test"
	}	
}

resource "aws_eip" "ec2_eip" {
  #domain = "vpc" 
  instance = aws_instance.server-test.id
  associate_with_private_ip = var.ip-privada
  
  tags = {
    Name = "ec2-elastic-ip"
  }
  
  depends_on = [aws_instance.server-test]
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile"
  role = data.aws_iam_role.existing_role.name
}