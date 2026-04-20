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
# Certificate Module - Simple Managed Certificate
################################################################################

module "certificate" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_managed = true
  domain_names   = ["example.com"]
}
