module "managed" {
  source = "./modules/managed"

  create       = var.create_managed
  name         = coalesce(var.managed_name, "${var.name}-managed")
  domain_names = var.domain_names
  labels       = var.labels
}

module "uploaded" {
  source = "./modules/uploaded"

  create      = var.create_uploaded
  name        = coalesce(var.uploaded_name, "${var.name}-uploaded")
  certificate = var.certificate
  private_key = var.private_key
  labels      = var.labels
}
