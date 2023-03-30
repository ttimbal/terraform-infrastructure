module "auth" {
  source = "./auth"

  events = var.events
  roles = var.roles
}
