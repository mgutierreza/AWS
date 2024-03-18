resource "aws_default_security_group" "sg-access-itera-vpc" {
  vpc_id = aws_vpc.vpc_ueast_1_QA.id

  dynamic "ingress" {
    for_each = var.ingress_ports_list
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.sg_ingress_cird]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "All Trafic"
    cidr_blocks = [var.sg_ingress_cird]
  }

  tags = {
    Name = "Bastion - permitido todo el tráfico"
  }
}