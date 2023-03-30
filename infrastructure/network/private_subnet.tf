module "private_subnet" {
  source = "../../modules/network/subnet"

  name = "private-subnet-${local.environment}"

  vpc_id      = module.vpc.vpc.id
  subnet_cidr = var.private_subnet_cidr
}