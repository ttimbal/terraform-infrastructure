module "sqs_test" {
  source = "../../../../modules/events/sqs"

  name = "sqs-test-${var.environment}"
}

output "sqs_test" {
  value = module.sqs_test.sqs
}