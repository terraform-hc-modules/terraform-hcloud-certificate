output "managed_id" {
  description = "ID of the managed certificate."
  value       = module.managed.id
}

output "uploaded_id" {
  description = "ID of the uploaded certificate."
  value       = module.uploaded.id
}
