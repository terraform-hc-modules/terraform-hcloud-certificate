provider "hcloud" {}

module "cert" {
  source = "../../modules/managed"

  name         = "ex-simple"
  domain_names = ["example.com"]
}
