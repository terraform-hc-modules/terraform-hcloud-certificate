variable "create" {
  type    = bool
  default = true
}

variable "name" {
  type = string
}

variable "domain_names" {
  type = list(string)
}

variable "labels" {
  type    = map(string)
  default = {}
}
