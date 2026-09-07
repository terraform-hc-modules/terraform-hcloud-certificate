output "certificate_id" {
  description = "ID of the managed certificate."
  value       = module.certificate.managed_id
}

output "certificate_name" {
  description = "Name of the managed certificate."
  value       = module.certificate.managed_name
}
