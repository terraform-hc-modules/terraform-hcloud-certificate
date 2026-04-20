resource "hcloud_uploaded_certificate" "this" {
  count = var.create ? 1 : 0

  name        = var.name
  certificate = var.certificate
  private_key = var.private_key
  labels      = var.labels
}
