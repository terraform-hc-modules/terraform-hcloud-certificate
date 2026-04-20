provider "hcloud" {}

module "cert" {
  source = "../../"

  name = "ex-complete"

  create_managed = true
  domain_names   = ["example.com", "www.example.com"]
}
