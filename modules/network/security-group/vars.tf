variable "name" {
  type = string
}

variable "description" {
  type = string
  default = null
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "ingress" {
  type = list(object({
    description      = optional(string)
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
  }))
}

variable "egress" {
  type = list(object({
    description      = optional(string)
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
  }))
}