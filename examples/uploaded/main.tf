provider "hcloud" {
  token = var.hcloud_token
}

module "uploaded_certificate" {
  source = "../../modules/uploaded"

  name        = "example-uploaded-cert"
  certificate = var.certificate
  private_key = var.private_key

  labels = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
