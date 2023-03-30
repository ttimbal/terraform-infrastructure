module "vpc" {
  source = "../../modules/network/vpc"

  name       = "vpc-${local.environment}"
  cidr_block = var.cidr_block
}