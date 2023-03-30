variable "region" {
  type = string
  default = "us-east-1"
}

variable "cidr_block" {
  type = string
  description = "Base network address for VPC"
}

variable "private_subnet_cidr" {
  type = string
  description = "Base network address subnet"
}

variable "public_subnet_cidr" {
  type = string
  description = "Base network address subnet"
}