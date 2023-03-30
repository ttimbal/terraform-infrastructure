variable "enable_dns_hostnames" {
  type = bool
  default = false
}

variable "cidr_block" {
  type = string
  description = "Base network for subnets"
}

variable "name" {
  type = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}