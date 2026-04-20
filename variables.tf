variable "name" {
  description = "Name prefix for the certificates."
  type        = string
}

variable "labels" {
  description = "Labels to apply to the certificates."
  type        = map(string)
  default     = {}
}

variable "create_managed" {
  description = "Whether to create a managed (Let's Encrypt) certificate."
  type        = bool
  default     = false
}

variable "managed_name" {
  description = "Name for the managed certificate. Defaults to name if not set."
  type        = string
  default     = null
}

variable "domain_names" {
  description = "List of domain names for the managed certificate."
  type        = list(string)
  default     = []

  validation {
    condition     = var.create_managed ? length([for d in var.domain_names : d if length(trimspace(d)) > 0]) > 0 : true
    error_message = "When create_managed is true, domain_names must contain at least one non-empty domain."
  }
}

variable "create_uploaded" {
  description = "Whether to create an uploaded certificate."
  type        = bool
  default     = false
}

variable "uploaded_name" {
  description = "Name for the uploaded certificate. Defaults to name if not set."
  type        = string
  default     = null
}

variable "certificate" {
  description = "PEM encoded certificate for uploaded certificate."
  type        = string
  default     = ""
  sensitive   = true

  validation {
    condition     = var.create_uploaded ? length(trimspace(var.certificate)) > 0 : true
    error_message = "When create_uploaded is true, certificate must be a non-empty PEM string."
  }
}

variable "private_key" {
  description = "PEM encoded private key for uploaded certificate."
  type        = string
  default     = ""
  sensitive   = true

  validation {
    condition     = var.create_uploaded ? length(trimspace(var.private_key)) > 0 : true
    error_message = "When create_uploaded is true, private_key must be a non-empty PEM string."
  }
}
