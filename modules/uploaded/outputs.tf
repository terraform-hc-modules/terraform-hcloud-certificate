output "id" {
  description = "ID of the uploaded certificate."
  value       = try(hcloud_uploaded_certificate.this[0].id, null)
}

output "name" {
  description = "Name of the uploaded certificate."
  value       = try(hcloud_uploaded_certificate.this[0].name, null)
}
