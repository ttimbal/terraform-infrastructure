module "network" {
  source = "./network"

  region              = var.region
  cidr_block          = var.cidr_block
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
}

module "storage" {
  source = "./storage"
}

module "services" {
  source = "./services"
}