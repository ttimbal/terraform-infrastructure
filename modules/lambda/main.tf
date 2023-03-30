resource "aws_s3_object" "object" {
  bucket = var.bucket_name
  key    = var.s3_key
}

resource "aws_lambda_function" "lambda" {
  s3_bucket                      = var.bucket_name
  s3_key                         = var.s3_key
  s3_object_version              = aws_s3_object.object.version_id
  function_name                  = var.name
  handler                        = var.handler[var.runtime]
  runtime                        = var.runtime
  timeout                        = var.timeout
  memory_size                    = var.memory_size
  role                           = var.role_arn
  publish                        = true
  reserved_concurrent_executions = var.reserved_concurrent_executions
  architectures                  = var.architectures

  environment {
    variables = var.env_variables
  }

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}


resource "aws_lambda_alias" "lambda_alias" {
  name             = var.alias.name
  function_name    = aws_lambda_function.lambda.arn
  function_version = var.alias.version
}

resource "aws_lambda_function_event_invoke_config" "lambda_retry" {
  function_name          = aws_lambda_function.lambda.function_name
  qualifier              = aws_lambda_alias.lambda_alias.name
  maximum_retry_attempts = var.maximum_retry_attempts
}

# Lambda triggered by SQS
resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  count = length(var.sqs_triggers)

  function_name    = aws_lambda_function.lambda.function_name
  event_source_arn = var.sqs_triggers[count.index].arn
  batch_size       = var.sqs_triggers[count.index].batch_size
  enabled          = var.sqs_triggers[count.index].enabled
}

# Lambda triggered by SNS
resource "aws_sns_topic_subscription" "sns_subscription" {
  count = length(var.sns_triggers)

  endpoint  = aws_lambda_alias.lambda_alias.arn
  topic_arn = var.sns_triggers[count.index].arn
  protocol  = "lambda"
}

resource "aws_lambda_permission" "sns_subscription" {
  count = length(var.sns_triggers)

  principal     = "sns.amazonaws.com"
  action        = "lambda:InvokeFunction"
  source_arn    = var.sns_triggers[count.index].arn

  function_name = aws_lambda_function.lambda.function_name
  qualifier     = aws_lambda_alias.lambda_alias.name
}

output "lambda" {
  value = aws_lambda_function.lambda
}