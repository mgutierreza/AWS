resource "aws_default_security_group" "sg-access-itera-vpc" {
  vpc_id = aws_vpc.vpc_ueast_1_QA.id

  ingress {
    description = "All trafic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion - permitido todo el tráfico"
  }
}