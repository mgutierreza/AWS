resource "aws_security_group" "server-test-security-group" {
  name        = "sg_server_test"
  description = "Creacion de grupo de seguridad para HTTP/HTTPS"
  vpc_id = data.aws_vpc.vpc-server-test.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 indica que se permite cualquier protocolo (TCP, UDP, ICMP, etc.)
    cidr_blocks = ["0.0.0.0/0"]
  }
}