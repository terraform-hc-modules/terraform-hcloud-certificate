variable "name" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "create_managed" {
  type    = bool
  default = false
}

variable "managed_name" {
  type    = string
  default = null
}

variable "domain_names" {
  type    = list(string)
  default = []
}

variable "create_uploaded" {
  type    = bool
  default = false
}

variable "uploaded_name" {
  type    = string
  default = null
}

variable "certificate" {
  type      = string
  default   = ""
  sensitive = true
}

variable "private_key" {
  type      = string
  default   = ""
  sensitive = true
}
