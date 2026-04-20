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
# Certificate Module - Managed Only (Let's Encrypt)
################################################################################

module "certificate" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_managed = true
  domain_names   = ["example.com", "www.example.com"]
}

output "certificate_id" {
  description = "ID of the managed certificate"
  value       = module.certificate.managed_id
}
