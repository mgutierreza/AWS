resource "aws_default_security_group" "SG-CICLOTRON" {
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "ALL TRAFIC"
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
    Name = var.default_security_group_name
  }
}