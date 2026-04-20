provider "hcloud" {}

locals {
  name = "ex-${basename(path.cwd)}"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-hcloud-certificate"
    GithubOrg  = "terraform-hc-modules"
  }
}

################################################################################
# Certificate Module - Complete (Managed + Uploaded)
################################################################################

# Managed certificate (Let's Encrypt)
module "managed_cert" {
  source = "../../modules/managed"

  name         = "${local.name}-managed"
  domain_names = ["example.com", "*.example.com"]
  labels       = local.tags
}

# Uploaded certificate (bring your own)
module "uploaded_cert" {
  source = "../../modules/uploaded"

  name        = "${local.name}-uploaded"
  certificate = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIIBkTCB+wIJAKHBfLf...
    -----END CERTIFICATE-----
  EOT
  private_key = <<-EOT
    -----BEGIN PRIVATE KEY-----
    MIIEvgIBADANBgkqhki...
    -----END PRIVATE KEY-----
  EOT
  labels      = local.tags
}

output "managed_cert_id" {
  value = module.managed_cert.id
}

output "uploaded_cert_id" {
  value = module.uploaded_cert.id
}
