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
# Certificate Module - Both Managed and Uploaded
################################################################################

module "certificates" {
  source = "../../"

  name   = local.name
  labels = local.tags

  # Create a managed certificate (Let's Encrypt)
  create_managed = true
  domain_names   = ["example.com", "*.example.com"]

  # Also create an uploaded certificate
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

output "managed_cert_id" {
  description = "ID of the managed certificate"
  value       = module.certificates.managed_id
}

output "uploaded_cert_id" {
  description = "ID of the uploaded certificate"
  value       = module.certificates.uploaded_id
}
