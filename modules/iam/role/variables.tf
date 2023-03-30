variable "name" {
  type = string
}

variable "description" {
  type = string
  default = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "policy_arns" {
  type    = list(any)
  default = []
}

variable "assume_role" {
  type = object({
    type=string
    identifiers=list(string)
  })
  default = {
    type          = ""
    identifiers   = []
  }
}