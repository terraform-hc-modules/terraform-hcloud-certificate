variable "create" {
  type    = bool
  default = true
}

variable "name" {
  type = string
}

variable "certificate" {
  type      = string
  sensitive = true
}

variable "private_key" {
  type      = string
  sensitive = true
}

variable "labels" {
  type    = map(string)
  default = {}
}
