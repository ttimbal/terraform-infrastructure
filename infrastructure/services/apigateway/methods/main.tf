module "auth" {
  source = "./auth"

  parent_id = var.parent_id
  configuration = var.configuration
  lambda_module = var.lambda_module.auth
}