output "certificate_id" {
  description = "ID of the uploaded certificate"
  value       = module.uploaded_certificate.id
}

output "certificate_name" {
  description = "Name of the uploaded certificate"
  value       = module.uploaded_certificate.name
}

output "certificate_domain_names" {
  description = "Domain names of the uploaded certificate"
  value       = module.uploaded_certificate.domain_names
}

output "certificate_fingerprint" {
  description = "Fingerprint of the uploaded certificate"
  value       = module.uploaded_certificate.fingerprint
}
