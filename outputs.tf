output "managed_id" {
  description = "ID of the managed certificate."
  value       = module.managed.id
}

output "managed_name" {
  description = "Name of the managed certificate."
  value       = module.managed.name
}

output "uploaded_id" {
  description = "ID of the uploaded certificate."
  value       = module.uploaded.id
}

output "uploaded_name" {
  description = "Name of the uploaded certificate."
  value       = module.uploaded.name
}

output "managed" {
  description = "Managed certificate outputs as an object."
  value = {
    id           = module.managed.id
    name         = module.managed.name
    domain_names = module.managed.domain_names
    certificate  = module.managed.certificate
  }
  sensitive = true
}

output "uploaded" {
  description = "Uploaded certificate outputs as an object."
  value = {
    id   = module.uploaded.id
    name = module.uploaded.name
  }
}