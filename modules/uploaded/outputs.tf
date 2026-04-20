output "id" {
  value = try(hcloud_uploaded_certificate.this[0].id, null)
}
