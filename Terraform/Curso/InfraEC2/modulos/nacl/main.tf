resource "aws_default_network_acl" "default" {
 
  default_network_acl_id = var.vpc_default_network_acl_id
  subnet_ids = concat(var.public_subnet_ids, var.private_subnet_ids) 

  dynamic ingress {
    for_each = var.ingress_rules
    content {
      protocol   = ingress.value.protocol
      rule_no    = ingress.value.rule_number
      action     = ingress.value.action
      cidr_block = ingress.value.cidr_block
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
    }
  }

  dynamic egress {
    for_each = var.egress_rules
    content {
      protocol   = egress.value.protocol
      rule_no    = egress.value.rule_number
      action     = egress.value.action
      cidr_block = egress.value.cidr_block
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
    }
  }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-nacl"
  })
}