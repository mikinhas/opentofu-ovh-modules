# ovh/domains

OpenTofu module to manage an OVH DNS zone with its records and, optionally,
the domain's name servers.

## Requirements

- OpenTofu `>= 1.6`
- OVH provider `>= 1.0`
- OVH API credentials ([create an application](https://eu.api.ovh.com/createApp/))

## Authentication

```bash
export OVH_ENDPOINT="ovh-eu"
export OVH_APPLICATION_KEY="your_application_key"
export OVH_APPLICATION_SECRET="your_application_secret"
export OVH_CONSUMER_KEY="your_consumer_key"
```

## Usage

```hcl
module "dns" {
  source = "git::https://github.com/mikinhas/opentofu-ovh-modules.git//modules/domains?ref=domains/v0.1.0"

  zone = "example.com"

  records = {
    root_a = {
      fieldtype = "A"
      target    = "203.0.113.10"
    }
    www = {
      subdomain = "www"
      fieldtype = "CNAME"
      target    = "example.com."
    }
    mx = {
      fieldtype = "MX"
      target    = "10 mail.example.com."
    }
  }
}
```

## Inputs

| Name           | Type            | Default | Description                                                                              |
|----------------|-----------------|---------|------------------------------------------------------------------------------------------|
| `zone`         | `string`        | —       | DNS zone to manage (e.g. `example.com`).                                                 |
| `records`      | `map(object)`   | `{}`    | DNS records to create, keyed by a stable identifier — see schema below.                  |
| `name_servers` | `list(string)`  | `null`  | Custom name servers. Leave `null` to keep OVH's existing name servers unchanged. 2–8 entries, no trailing dot. |

### `records` object schema

| Field       | Type     | Required | Default | Description                                    |
|-------------|----------|----------|---------|------------------------------------------------|
| `subdomain` | `string` | no       | `""`    | Subdomain (empty = root)                       |
| `fieldtype` | `string` | yes      | —       | DNS type: A, AAAA, CNAME, MX, TXT, NS, SRV…    |
| `target`    | `string` | yes      | —       | Record value                                   |
| `ttl`       | `number` | no       | `3600`  | TTL in seconds                                 |

## Outputs

| Name           | Description                                            |
|----------------|--------------------------------------------------------|
| `zone`         | DNS zone information from `ovh_domain_zone`.           |
| `records`      | Map of created DNS records, keyed by their input key.  |
| `name_servers` | Configured name servers, or `null` if left unchanged.  |

## Notes

- **Stable map keys.** Each entry in `records` is keyed by a user-chosen
  identifier (`root_a`, `www`, `mx`…). Renaming a key changes the Terraform
  address and forces a destroy + recreate of that record. Choose stable keys
  upfront.
- **Name servers.** Setting `name_servers` calls `ovh_domain_name_servers`,
  which only works on a domain *registered* with OVH (not a zone-only
  customer). Leave it `null` otherwise.

## Example

See [`examples/complete/`](examples/complete/).
