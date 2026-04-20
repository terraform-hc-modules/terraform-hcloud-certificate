module "wrapper" {
  source   = "../"
  for_each = var.items

  name           = try(each.value.name, each.key)
  labels         = try(each.value.labels, {})
  create_managed = try(each.value.create_managed, false)
  domain_names   = try(each.value.domain_names, [])
}

variable "items" {
  type    = any
  default = {}
}

output "wrapper" {
  value = module.wrapper
}
