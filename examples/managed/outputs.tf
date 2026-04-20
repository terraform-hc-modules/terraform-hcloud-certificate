output "certificate_id" {
  description = "ID of the managed certificate"
  value       = module.managed_certificate.id
}

output "certificate_name" {
  description = "Name of the managed certificate"
  value       = module.managed_certificate.name
}

output "certificate_domain_names" {
  description = "Domain names of the managed certificate"
  value       = module.managed_certificate.domain_names
}

output "certificate_fingerprint" {
  description = "Fingerprint of the managed certificate"
  value       = module.managed_certificate.fingerprint
}
