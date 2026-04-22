# Managed

Manages Hetzner Cloud managed (Let's Encrypt) certificates.

Part of [`terraform-hc-modules/certificate/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just managed resources.

## Usage

```hcl
module "managed" {
  source = "terraform-hc-modules/certificate/hcloud//modules/managed"
  # version = "~> 0.1"

  # See inputs below.
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.45 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.45 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_managed_certificate.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/managed_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the managed certificate. | `bool` | `true` | no |
| <a name="input_domain_names"></a> [domain\_names](#input\_domain\_names) | Domain names for the managed certificate. | `list(string)` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the managed certificate. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_certificate"></a> [certificate](#output\_certificate) | PEM encoded certificate (managed). |
| <a name="output_domain_names"></a> [domain\_names](#output\_domain\_names) | Domain names of the managed certificate. |
| <a name="output_id"></a> [id](#output\_id) | ID of the managed certificate. |
| <a name="output_name"></a> [name](#output\_name) | Name of the managed certificate. |
<!-- END_TF_DOCS -->
