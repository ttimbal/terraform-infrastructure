variable "name" {
  type = string
}

variable "description" {
  type = string
  default = ""
}

variable "policy" {}

variable "tags" {
  type        = map(string)
  default     = {}
}