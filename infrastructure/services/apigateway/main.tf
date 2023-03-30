module "api_gateway" {
  source = "../../../modules/apigateway/rest"

  name = "api-${local.environment}"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  configuration = {
    region        = data.aws_region.current.name
    account_id    = data.aws_caller_identity.current.account_id
    rest_api_id   = module.api_gateway.rest_api.id
    authorizer_id = ""
  }
}

module "methods" {
  source = "./methods"

  parent_id     = module.api_gateway.rest_api.root_resource_id
  lambda_module = var.lambda_module
  configuration = local.configuration
}

module "api_gateway_deployment" {
  source        = "../../../modules/apigateway/deployment"
  stage_name    = "V1"
  logging_level = "ERROR"
  rest_api_id   = module.api_gateway.rest_api.id
  metrics_enabled = true

  depends_on = [module.methods]
}