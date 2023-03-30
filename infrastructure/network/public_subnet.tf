module "public_subnet" {
  source = "../../modules/network/subnet"

  name = "public-subnet-${local.environment}"

  vpc_id      = module.vpc.vpc.id
  subnet_cidr = var.public_subnet_cidr
}