module "sns_test" {
  source = "../../../../modules/events/sns"

  name = "sns-test-${var.environment}"
}

output "sns_test" {
  value = module.sns_test.sns
}