module "roles" {
  source = "./roles"
}

module "events" {
  source = "./events"
}

module "lambdas" {
  source = "./lambdas"

  events = module.events
  roles = module.roles
}

module "api_gateway" {
  source = "./apigateway"

  lambda_module = module.lambdas
}