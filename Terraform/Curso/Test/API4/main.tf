module "lambda" {
  source           = "./modulos/lambda"
  function_name    = "belcorp-citas"
  lambda_source_file = "./modulos/lambda/code/handler.py"
  lambda_handler   = "handler.lambda_handler"
  runtime          = "python3.9"
}

module "api_gateway" {
  source               = "./modulos/api-gateway"
  api_name             = "belcorp-citas-api"
  api_description      = "API para Citas Célebres"
  lambda_invoke_arn    = module.lambda.lambda_invoke_arn
  lambda_function_name = module.lambda.function_name
}

module "dashboard" {
  source     = "./modulos/dashboard"
  api_name   = module.api_gateway.api_name
  stage_name = "dev"
  region     = var.aws_region
}