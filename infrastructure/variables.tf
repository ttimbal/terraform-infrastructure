variable "region" {
  type = string
  default = "us-east-1"
}

variable "cidr_block" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}