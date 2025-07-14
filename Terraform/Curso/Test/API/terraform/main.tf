
resource "aws_iam_role" "lambda_exec" {
  name = "belcorp-lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "../lambda/handler.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "belcorp_greeting" {
  filename      = "lambda_function.zip"
  function_name = "belcorp-greeting"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "handler.lambda_handler"
  runtime       = "python3.9"
  timeout       = 10
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}

resource "aws_api_gateway_rest_api" "belcorp_api" {
  name        = "belcorp-greeting-api"
  description = "API para saludo Belcorp"
}

resource "aws_api_gateway_resource" "greeting" {
  rest_api_id = aws_api_gateway_rest_api.belcorp_api.id
  parent_id   = aws_api_gateway_rest_api.belcorp_api.root_resource_id
  path_part   = "greeting"
}

resource "aws_api_gateway_method" "get_method" {
  rest_api_id   = aws_api_gateway_rest_api.belcorp_api.id
  resource_id   = aws_api_gateway_resource.greeting.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.belcorp_api.id
  resource_id             = aws_api_gateway_resource.greeting.id
  http_method             = aws_api_gateway_method.get_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.belcorp_greeting.invoke_arn
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.belcorp_greeting.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.belcorp_api.execution_arn}/*/GET/greeting"
}

resource "aws_api_gateway_deployment" "dev_deployment" {
  depends_on = [aws_api_gateway_integration.lambda_integration]

  rest_api_id = aws_api_gateway_rest_api.belcorp_api.id
  stage_name  = "dev"

  variables = {
    deployed_at = timestamp()
  }
}

resource "aws_cloudwatch_log_group" "api_gateway_logs" {
  name              = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.belcorp_api.id}/dev"
  retention_in_days = 7
}

resource "aws_cloudwatch_dashboard" "api_dashboard" {
  dashboard_name = "belcorp-api-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/ApiGateway", "Count", "ApiName", "belcorp-greeting-api", "Stage", "dev"],
            [".", "4XXError", ".", ".", ".", "."],
            [".", "5XXError", ".", ".", ".", "."]
          ]
          period = 300
          stat   = "Sum"
          region = "us-west-2"
          title  = "Métricas de API"
        }
      }
    ]
  })
}