variable "rest_api_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "stage_name" {
  type = string
}

variable "variables" {
  type = map(string)

  default = {}
}

variable "logging_level" {
  type = string
}

variable "metrics_enabled" {
  type = bool
}