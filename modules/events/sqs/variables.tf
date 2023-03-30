variable "name" {
  type = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "fifo_queue" {
  type = bool
  default = false
}