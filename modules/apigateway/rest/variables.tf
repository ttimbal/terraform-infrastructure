variable "name" {
  type = string
}

variable "description" {
  type = string
  default = ""
}

variable type {
  type = string
  default = "REGIONAL"
}

variable "tags" {
  type    = map(string)
  default = {}
}