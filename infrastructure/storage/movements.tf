module "movements" {
  source = "../../modules/storage"

  name = "movements-${local.environment}"
}

output "movements" {
  value = module.movements.s3
}