resource "aws_network_acl" "main" {
  vpc_id     = var.vpc_id
  subnet_ids = concat(var.public_subnet_ids, var.private_subnet_ids) 

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-nacl"
  })
}

# Reglas de entrada (ingress)
resource "aws_network_acl_rule" "ingress" {
  count          = length(var.ingress_rules)
  network_acl_id = aws_network_acl.main.id
  rule_number    = var.ingress_rules[count.index].rule_number
  egress         = false
  protocol       = var.ingress_rules[count.index].protocol
  rule_action    = var.ingress_rules[count.index].action
  cidr_block     = var.ingress_rules[count.index].cidr_block
  from_port      = var.ingress_rules[count.index].from_port
  to_port        = var.ingress_rules[count.index].to_port
}

# Reglas de salida (egress)
resource "aws_network_acl_rule" "egress" {
  count          = length(var.egress_rules)
  network_acl_id = aws_network_acl.main.id
  rule_number    = var.egress_rules[count.index].rule_number
  egress         = true
  protocol       = var.egress_rules[count.index].protocol
  rule_action    = var.egress_rules[count.index].action
  cidr_block     = var.egress_rules[count.index].cidr_block
  from_port      = var.egress_rules[count.index].from_port
  to_port        = var.egress_rules[count.index].to_port
}