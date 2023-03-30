resource "aws_api_gateway_method" "method" {
  rest_api_id   = var.configuration.rest_api_id
  resource_id   = var.resource_id
  http_method   = var.http_method
  authorization = var.http_method == "OPTIONS" ? "NONE" : var.authorization
  authorizer_id = var.http_method == "OPTIONS" || var.authorization== "NONE" ? "" : var.configuration.authorizer_id
}

data "aws_lambda_function" "lambda" {
  count = var.integration_type != "MOCK" ? 1 : 0

  function_name = var.lambda.function_name
  qualifier = var.lambda_alias
}

resource "aws_api_gateway_integration" "integration_request" {
  count = var.integration_type != "MOCK" ? 1 : 0

  rest_api_id             = var.configuration.rest_api_id
  resource_id             = var.resource_id
  http_method             = var.http_method
  integration_http_method = aws_api_gateway_method.method.http_method
  type                    = var.integration_type
  uri                     = "arn:aws:apigateway:${var.configuration.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.configuration.region}:${var.configuration.account_id}:function:${var.lambda.function_name}:${var.lambda_alias}/invocations"
}

resource "aws_api_gateway_integration" "integration" {
  count = var.integration_type == "MOCK" ? 1 : 0

  rest_api_id = var.configuration.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.method.http_method
  type        = "MOCK"

  request_templates    = var.request_templates
  passthrough_behavior = var.passthrough_behavior
}

resource "aws_api_gateway_method_response" "response" {
  rest_api_id = var.configuration.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.method.http_method
  status_code = "200"

  response_parameters = var.response_parameters
  response_models     = var.response_models

  /*  response_models = {
      "application/json" = "Empty"
    }*/
}

resource "aws_api_gateway_integration_response" "integration_response" {
  rest_api_id = var.configuration.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method_response.response.http_method
  status_code = aws_api_gateway_method_response.response.status_code

  response_parameters = var.response_integration_parameters
  response_templates  = var.response_templates
}

resource "aws_lambda_permission" "allow_api_gateway" {
  count = var.integration_type != "MOCK" ? 1 : 0

  function_name = var.lambda.function_name
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.configuration.region}:${var.configuration.account_id}:${var.configuration.rest_api_id}/*/${aws_api_gateway_method.method.http_method}${var.resource_path}"
}

output "method" {
  value = aws_api_gateway_method.method
}