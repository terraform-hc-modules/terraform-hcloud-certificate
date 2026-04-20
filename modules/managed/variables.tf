variable "create" {
  description = "Whether to create the managed certificate."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the managed certificate."
  type        = string
}

variable "domain_names" {
  description = "Domain names for the managed certificate."
  type        = list(string)

  validation {
    condition     = var.create ? length([for d in var.domain_names : d if length(trimspace(d)) > 0]) > 0 : true
    error_message = "When create is true, domain_names must contain at least one non-empty domain."
  }
}

variable "labels" {
  description = "Labels to apply."
  type        = map(string)
  default     = {}
}
