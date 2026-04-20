variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

variable "certificate" {
  description = "PEM encoded certificate"
  type        = string
  sensitive   = true
}

variable "private_key" {
  description = "PEM encoded private key"
  type        = string
  sensitive   = true
}
