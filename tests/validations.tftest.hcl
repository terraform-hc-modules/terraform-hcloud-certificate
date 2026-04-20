provider "hcloud" {
  token = "dummy"
}

run "managed_requires_domain_names" {
  command = plan

  variables {
    name           = "test"
    create_managed = true
    domain_names   = []
  }

  expect_failures = [var.domain_names]
}

run "uploaded_requires_certificate" {
  command = plan

  variables {
    name            = "test"
    create_uploaded = true
    certificate     = ""
    private_key     = "-----BEGIN PRIVATE KEY-----\nabc\n-----END PRIVATE KEY-----"
  }

  expect_failures = [var.certificate]
}

run "uploaded_requires_private_key" {
  command = plan

  variables {
    name            = "test"
    create_uploaded = true
    certificate     = "-----BEGIN CERTIFICATE-----\nabc\n-----END CERTIFICATE-----"
    private_key     = ""
  }

  expect_failures = [var.private_key]
}

run "managed_ok_minimal" {
  command = plan

  variables {
    name           = "test"
    create_managed = true
    domain_names   = ["example.com"]
  }
}

run "uploaded_ok_minimal" {
  command = plan

  variables {
    name            = "test"
    create_uploaded = true
    certificate     = "-----BEGIN CERTIFICATE-----\nabc\n-----END CERTIFICATE-----"
    private_key     = "-----BEGIN PRIVATE KEY-----\nabc\n-----END PRIVATE KEY-----"
  }
}

