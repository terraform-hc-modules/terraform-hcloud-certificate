# Hetzner Cloud Certificate Module

Terraform module for SSL/TLS certificates on Hetzner Cloud.

## Usage

```hcl
# Managed certificate (Let's Encrypt)
module "cert" {
  source  = "terraform-hc-modules/certificate/hcloud//modules/managed"
  version = "~> 0.1"

  name         = "my-cert"
  domain_names = ["example.com", "www.example.com"]
}

# Uploaded certificate
module "cert" {
  source  = "terraform-hc-modules/certificate/hcloud//modules/uploaded"
  version = "~> 0.1"

  name        = "my-cert"
  certificate = file("cert.pem")
  private_key = file("key.pem")
}
```

## Submodules

| Module | Description |
|--------|-------------|
| [managed](modules/managed) | Let's Encrypt managed certificates |
| [uploaded](modules/uploaded) | Custom uploaded certificates |

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## License

Mozilla Public License 2.0
