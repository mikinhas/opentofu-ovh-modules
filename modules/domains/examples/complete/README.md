# Complete example — `domains`

Runnable example exercising every input of the `domains` module:

- A / AAAA at the apex
- CNAME on `www`
- A on `api` with a custom TTL
- MX, SPF (TXT), DMARC (TXT)
- Optional `name_servers` override (commented)

## Run it

```bash
export OVH_ENDPOINT="ovh-eu"
export OVH_APPLICATION_KEY="…"
export OVH_APPLICATION_SECRET="…"
export OVH_CONSUMER_KEY="…"

tofu init
tofu plan
tofu apply
```

Replace `zone` and `target` values in `main.tf` with a domain you actually own
before applying.
