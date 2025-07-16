output "api_url" {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}/${var.resource_path}"
}

output "execution_arn" {
  value = aws_api_gateway_rest_api.api.execution_arn
}

output "api_name" {
  value = aws_api_gateway_rest_api.api.name
}