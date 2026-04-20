provider "hcloud" {}

locals {
  name = "ex-${basename(path.cwd)}"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-hcloud-certificate"
    GithubOrg  = "terraform-hc-modules"
  }

  # Example certificate and key (replace with real values)
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
}

################################################################################
# Uploaded Certificate
################################################################################

module "certificate" {
  source = "../../modules/uploaded"

  name        = local.name
  certificate = local.certificate
  private_key = local.private_key
  labels      = local.tags
}
