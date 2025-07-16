output "api_url" {
  value = module.api_gateway.api_url
}

output "lambda_function_name" {
  value = module.lambda.function_name
}

output "dashboard_url" {
  value = "https://console.aws.amazon.com/cloudwatch/home?region=${var.aws_region}#dashboards:name=${module.dashboard.dashboard_name}"
}