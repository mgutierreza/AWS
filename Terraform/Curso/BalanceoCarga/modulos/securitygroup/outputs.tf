output "sg_id" {
  value = aws_security_group.server-test-security-group.id
}

output "sg_id_alb" {
  value = aws_security_group.server-test-alb-security-group.id
}