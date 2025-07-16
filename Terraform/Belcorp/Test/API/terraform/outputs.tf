output "api_url" {
  value = "${aws_api_gateway_deployment.dev_deployment.invoke_url}/greeting"
}

output "lambda_function_name" {
  value = aws_lambda_function.belcorp_greeting.function_name
}