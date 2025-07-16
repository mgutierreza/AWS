module "monitoring" {
  source     = "./modulos/monitoring"
  api_name   = "quote-translator-api"
  stage_name = "dev"
  region_monitoreo = var.aws_region
}

module "lambda" {
  source                   = "./modulos/lambda"
  function_name            = "quote-translator"
  region                   = var.aws_region
  environment              = "dev"
  api_gateway_execution_arn = module.api_gateway.execution_arn
}

module "api_gateway" {
  source              = "./modulos/api-gateway"
  api_name            = "quote-translator-api"
  stage_name          = "dev"
  lambda_invoke_arn   = module.lambda.lambda_invoke_arn
  logs_cloudwatch_arn = module.monitoring.logs_cloudwatch_arn
}

output "api_url" {
  value = "${module.api_gateway.invoke_url}/quote"
}