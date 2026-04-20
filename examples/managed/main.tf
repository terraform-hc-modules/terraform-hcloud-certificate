provider "hcloud" {
  token = var.hcloud_token
}

module "managed_certificate" {
  source = "../../modules/managed"

  name         = "example-managed-cert"
  domain_names = ["example.com", "www.example.com"]

  labels = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
