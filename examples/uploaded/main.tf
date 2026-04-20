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
# Certificate Module - Uploaded Only (Bring Your Own)
################################################################################

module "certificate" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_uploaded = true
  certificate     = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIIBkTCB+wIJAKHBfLf...
    -----END CERTIFICATE-----
  EOT
  private_key     = <<-EOT
    -----BEGIN PRIVATE KEY-----
    MIIEvgIBADANBgkqhki...
    -----END PRIVATE KEY-----
  EOT
}

output "certificate_id" {
  description = "ID of the uploaded certificate"
  value       = module.certificate.uploaded_id
}
