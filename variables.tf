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
}

variable "private_key" {
  description = "PEM encoded private key for uploaded certificate."
  type        = string
  default     = ""
  sensitive   = true
}
