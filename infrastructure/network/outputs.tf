output "vpc" {
  value = module.vpc.vpc
}

output "private_subnet" {
  value = module.private_subnet
}

output "public_subnet" {
  value = module.private_subnet
}

output "security_group" {
  value = module.security_group
}