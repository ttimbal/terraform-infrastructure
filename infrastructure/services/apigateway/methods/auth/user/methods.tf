resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.configuration.rest_api_id
  parent_id   = var.parent_id
  path_part   = "user"
}

module "get" {
  source = "../../../../../../modules/apigateway/method"

  configuration = var.configuration
  http_method   = "GET"
  authorization = "NONE"
  lambda        = var.lambda_module.create_user
  resource_id   = aws_api_gateway_resource.resource.id
  resource_path = aws_api_gateway_resource.resource.path
}

module "options" {
  source = "../../../../../../modules/apigateway/method"

  configuration = var.configuration
  http_method   = "OPTIONS"
  authorization = "NONE"
  resource_id   = aws_api_gateway_resource.resource.id
  resource_path = aws_api_gateway_resource.resource.path
  integration_type = "MOCK"
}

