variable "region" {
  type = string
  default = ""
}

variable "account_id" {
  type = string
  default = ""
}

variable "resource_id" {
  type = string
}

variable "http_method" {
  type = string
}

variable "authorization" {
  type = string
}

variable "integration_type" {
  type = string
  default = "AWS_PROXY"
}

variable "lambda" {
  default = {}
}

variable "lambda_alias" {
  type = string
  default = "current"
}

variable "configuration" {}

variable "resource_path" {
  type = string
}

variable "request_parameters" {
  default = {}
}

variable "response_parameters" {
  default = {}
}

variable "response_models" {
  default = null
}

variable "response_integration_parameters" {
  default = {}
}

variable "response_templates" {
  default = {}
}

variable "request_templates" {
  default = {}
}

variable "passthrough_behavior" {
  default = "WHEN_NO_MATCH"
}