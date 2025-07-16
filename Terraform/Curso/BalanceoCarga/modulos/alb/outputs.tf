output "alb_dns_name" {
  value = aws_lb.ec2_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.ec2_tg.arn
}