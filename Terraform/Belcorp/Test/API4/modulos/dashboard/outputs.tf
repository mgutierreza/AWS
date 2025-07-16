output "log_group_arn" {
  value = aws_cloudwatch_log_group.api_gateway_logs.arn
}

output "dashboard_name" {
  value = aws_cloudwatch_dashboard.api_dashboard.dashboard_name
}
