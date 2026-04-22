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
# Supporting resources: network + load balancer (no real targets required)
################################################################################

module "network" {
  source  = "terraform-hc-modules/network/hcloud"
  version = "~> 0.1"

  name   = local.name
  labels = local.tags

  ip_range = "10.0.0.0/16"

  subnets = [
    {
      type         = "cloud"
      network_zone = "eu-central"
      ip_range     = "10.0.1.0/24"
    }
  ]
}

resource "hcloud_load_balancer" "this" {
  name               = "${local.name}-lb"
  load_balancer_type = "lb11"
  location           = "fsn1"
  labels             = local.tags
}

resource "hcloud_load_balancer_network" "this" {
  load_balancer_id = hcloud_load_balancer.this.id
  network_id       = module.network.id
  ip               = "10.0.1.10"
}

################################################################################
# Certificate module + attach to the load balancer (managed cert example)
################################################################################

module "certificate" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_managed = true
  domain_names   = ["example.com", "www.example.com"]
}

resource "hcloud_load_balancer_service" "https" {
  load_balancer_id = hcloud_load_balancer.this.id
  protocol         = "https"
  listen_port      = 443
  destination_port = 80

  http {
    certificates = compact([module.certificate.managed_id])
  }

  depends_on = [hcloud_load_balancer_network.this]
}

output "load_balancer_id" {
  value = hcloud_load_balancer.this.id
}

output "managed_certificate_id" {
  value = module.certificate.managed_id
}
