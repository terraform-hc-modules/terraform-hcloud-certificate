output "id" {
  value = try(hcloud_managed_certificate.this[0].id, null)
}

output "certificate" {
  value     = try(hcloud_managed_certificate.this[0].certificate, null)
  sensitive = true
}
