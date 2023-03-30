variable "bucket_name" {
  type = string
}

variable "dynamo_table_name" {
  type = string
}

variable "versioning" {
  type = bool
  default = false
}

variable "sse_algorithm" {
  type = string
  default = "AES256"
}