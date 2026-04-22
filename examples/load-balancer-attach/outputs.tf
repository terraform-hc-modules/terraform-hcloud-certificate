output "managed" {
  description = "Managed certificate details."
  value       = module.certificate.managed
  sensitive   = true
}
