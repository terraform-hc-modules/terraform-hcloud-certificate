resource "hcloud_managed_certificate" "this" {
  count = var.create ? 1 : 0

  name         = var.name
  domain_names = var.domain_names
  labels       = var.labels
}
