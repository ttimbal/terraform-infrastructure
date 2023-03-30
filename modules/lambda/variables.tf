variable "name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "s3_key" {
  type = string
}

variable "alias" {
  type = object({
    version = string
    name    = string
  })
  default = {
    version = "$LATEST"
    name    = "current"
  }
}

variable "runtime" {
  type    = string
  default = "nodejs16.x"
}

variable "handler" {
  type    = map(string)
  default = {
    "python3.8"  = "app.lambda_handler"
    "nodejs16.x" = "app.lambdaHandler"
  }
}

variable "timeout" {
  type    = number
  default = 60
}

variable "memory_size" {
  type    = number
  default = 128
}

variable "role_arn" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "env_variables" {
  type    = map(any)
  default = {}
}

variable "architectures" {
  type    = list(string)
  default = ["x86_64"]
}

variable "reserved_concurrent_executions" {
  type    = number
  default = 1
}

variable "maximum_retry_attempts" {
  type    = number
  default = 2
}

variable "sqs_triggers" {
  type = list(object({
    arn        = string
    enabled     = bool
    batch_size = number
  }))

  default = []
}

variable "sns_triggers" {
  type = list(object({
    arn        = string
  }))

  default = []
}