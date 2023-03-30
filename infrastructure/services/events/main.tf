locals {
  environment = terraform.workspace
}

module "sns" {
  source = "./sns"
  environment = local.environment
}

module "sqs" {
  source = "./sqs"
  environment = local.environment
}