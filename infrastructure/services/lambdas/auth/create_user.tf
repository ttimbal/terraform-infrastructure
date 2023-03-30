module "create_user" {
  source = "../../../../modules/lambda"

  bucket_name = "users-${local.environment}"
  s3_key = "create.zip"

  name = "create-user-${local.environment}"
  role_arn = var.roles.create_user.arn

  reserved_concurrent_executions = -1

  env_variables = {
    NAME="create-user-${local.environment}"
    ENABLED=true
  }

  /*  sqs_triggers = [
    {
      arn        = module.events.sqs.sqs_test.arn
      enabled    = true
      batch_size = 1
    }
  ]*/

  sns_triggers = [
    {
      arn=var.events.sns.sns_test.arn
    }
  ]
}



output "create_user" {
  value = module.create_user.lambda
}