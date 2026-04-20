# Architecture

This module is a thin wrapper that can create either (or both) of:

- A **Managed** certificate (Let's Encrypt)
- An **Uploaded** certificate (user-provided PEM + private key)

The module exposes both **simple scalar outputs** (IDs/names) and **nested object outputs** for convenience.

## Data flow

```mermaid
flowchart TB
  U[Caller / Root module] -->|inputs| C[terraform-hcloud-certificate]

  C -->|create_managed| M[modules/managed]
  C -->|create_uploaded| UP[modules/uploaded]

  M --> HM[hcloud_managed_certificate]
  UP --> HU[hcloud_uploaded_certificate]

  HM -->|id/name/cert| OUTM[managed outputs]
  HU -->|id/name| OUTU[uploaded outputs]

  OUTM --> U
  OUTU --> U
```

## Typical usage

- Use **managed certificates** for public domains where Let's Encrypt validation is viable.
- Use **uploaded certificates** when you already have a certificate chain and key material.
- For **load balancers**, you typically attach certificate IDs to the load balancer HTTPS service.

