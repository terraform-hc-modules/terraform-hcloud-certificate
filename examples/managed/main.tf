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
# Managed Certificate (Let's Encrypt)
################################################################################

module "certificate" {
  source = "../../modules/managed"

  name         = local.name
  domain_names = ["example.com", "www.example.com"]
  labels       = local.tags
}
