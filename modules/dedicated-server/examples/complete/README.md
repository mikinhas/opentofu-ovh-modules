# Complete example — dedicated-server

Installs and manages an already-delivered OVH dedicated server: adopts it by
`service_name`, installs Debian 12 with an SSH key, sets a hostname and display
name, and enables monitoring.

Replace `service_name` and `ssh_key` with your own values before running.

```bash
export OVH_ENDPOINT="ovh-eu"
export OVH_APPLICATION_KEY="..."
export OVH_APPLICATION_SECRET="..."
export OVH_CONSUMER_KEY="..."

tofu init
tofu plan
tofu apply   # ⚠️ triggers OS (re)installation — wipes the server
```

See the [module README](../../README.md) for all inputs and outputs.
