output "id" {
  description = "ID of the managed certificate."
  value       = try(hcloud_managed_certificate.this[0].id, null)
}

output "name" {
  description = "Name of the managed certificate."
  value       = try(hcloud_managed_certificate.this[0].name, null)
}

output "domain_names" {
  description = "Domain names of the managed certificate."
  value       = try(hcloud_managed_certificate.this[0].domain_names, null)
}

output "certificate" {
  description = "PEM encoded certificate (managed)."
  value       = try(hcloud_managed_certificate.this[0].certificate, null)
  sensitive   = true
}
