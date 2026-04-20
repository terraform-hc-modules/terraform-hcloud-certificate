# Hetzner Cloud Certificate Module

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.0-blueviolet)](https://www.terraform.io/)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL--2.0-blue.svg)](https://opensource.org/licenses/MPL-2.0)
[![CI](https://github.com/terraform-hc-modules/terraform-hcloud-certificate/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-hc-modules/terraform-hcloud-certificate/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/terraform-hc-modules/terraform-hcloud-certificate)](https://github.com/terraform-hc-modules/terraform-hcloud-certificate/releases)


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
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.45 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_managed"></a> [managed](#module\_managed) | ./modules/managed | n/a |
| <a name="module_uploaded"></a> [uploaded](#module\_uploaded) | ./modules/uploaded | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_certificate"></a> [certificate](#input\_certificate) | n/a | `string` | `""` | no |
| <a name="input_create_managed"></a> [create\_managed](#input\_create\_managed) | n/a | `bool` | `false` | no |
| <a name="input_create_uploaded"></a> [create\_uploaded](#input\_create\_uploaded) | n/a | `bool` | `false` | no |
| <a name="input_domain_names"></a> [domain\_names](#input\_domain\_names) | n/a | `list(string)` | `[]` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `map(string)` | `{}` | no |
| <a name="input_managed_name"></a> [managed\_name](#input\_managed\_name) | n/a | `string` | `null` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | n/a | `string` | `""` | no |
| <a name="input_uploaded_name"></a> [uploaded\_name](#input\_uploaded\_name) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_managed_id"></a> [managed\_id](#output\_managed\_id) | n/a |
| <a name="output_uploaded_id"></a> [uploaded\_id](#output\_uploaded\_id) | n/a |
<!-- END_TF_DOCS -->

## License

Mozilla Public License 2.0
