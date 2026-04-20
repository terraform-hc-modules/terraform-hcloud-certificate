variable "create" {
  description = "Whether to create the uploaded certificate."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the uploaded certificate."
  type        = string
}

variable "certificate" {
  description = "PEM encoded certificate."
  type        = string
  sensitive   = true

  validation {
    condition     = var.create ? length(trimspace(var.certificate)) > 0 : true
    error_message = "When create is true, certificate must be a non-empty PEM string."
  }
}

variable "private_key" {
  description = "PEM encoded private key."
  type        = string
  sensitive   = true

  validation {
    condition     = var.create ? length(trimspace(var.private_key)) > 0 : true
    error_message = "When create is true, private_key must be a non-empty PEM string."
  }
}

variable "labels" {
  description = "Labels to apply."
  type        = map(string)
  default     = {}
}
