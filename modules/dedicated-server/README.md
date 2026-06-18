# ovh/dedicated-server

OpenTofu module to install and manage an **already-delivered** OVH dedicated
(bare metal) server: it adopts the existing service by `service_name`, installs
the chosen OS with an SSH key, and manages editable properties (display name,
monitoring).

> This module does **not** order a server. Rent it first (OVH manager / API),
> then point this module at its `service_name`.

## Requirements

- OpenTofu `>= 1.6`
- OVH provider `>= 2.2`
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
module "server" {
  source = "git::https://github.com/mikinhas/opentofu-ovh-modules.git//modules/dedicated-server?ref=dedicated-server/v0.1.0"

  service_name = "nsXXXXXX.ip-XX-XX-XX.eu"
  os           = "debian12_64"
  ssh_key      = "ssh-ed25519 AAAA... you@host"

  hostname     = "tux"
  display_name = "prod-app-01"
  monitoring   = true
}
```

## Inputs

| Name                        | Type     | Default | Description                                                                                       |
|-----------------------------|----------|---------|---------------------------------------------------------------------------------------------------|
| `service_name`              | `string` | —       | Service name of the delivered server (e.g. `nsXXXXXX.ip-XX-XX-XX.eu`). Changing it forces replacement. |
| `os`                        | `string` | —       | OS / installation template to install (e.g. `debian12_64`).                                       |
| `ssh_key`                   | `string` | —       | Public SSH key authorized for the installed OS.                                                   |
| `hostname`                  | `string` | `null`  | Custom hostname set during installation.                                                          |
| `post_installation_script`  | `string` | `null`  | Post-installation script. Base64-encoding recommended (see Notes).                                |
| `display_name`              | `string` | `null`  | Display name in the OVH manager.                                                                  |
| `monitoring`                | `bool`   | `true`  | OVH ICMP monitoring state.                                                                        |
| `prevent_install_on_create` | `bool`   | `false` | Keep `false` to install the server on first apply.                                                |
| `prevent_install_on_import` | `bool`   | `true`  | Avoid reinstalling a server when importing it with differing install parameters.                 |

## Outputs

| Name           | Description                                                  |
|----------------|--------------------------------------------------------------|
| `service_name` | Service name of the dedicated server.                        |
| `name`         | Dedicated server name.                                       |
| `ip`           | Primary IPv4 address.                                        |
| `region`       | Region where the server is located.                         |
| `datacenter`   | Datacenter where the server is located.                     |
| `state`        | Administrative state (`ok`, `error`, `hacked`, …).          |
| `power_state`  | Power state (`poweron`, `poweroff`).                        |
| `boot_id`      | Boot id currently configured.                               |
| `os`           | Installed operating system.                                 |
| `display_name` | Display name of the server.                                 |

## Notes

- **Installation triggers on create.** With `prevent_install_on_create = false`
  (the default), the first apply installs the OS on the server. This **wipes**
  whatever is currently on it — intended for a freshly rented server.
- **`service_name` forces replacement.** It is the resource identity; changing it
  destroys and recreates the resource.
- **Finding the right `os`.** List the templates compatible with your server with
  the `ovh_dedicated_installation_template` data source, or via the API:
  `GET /dedicated/server/{serviceName}/install/compatibleTemplates`.
- **Post-installation script.** Sending it base64-encoded avoids escaping issues.
  Encode with: `cat my-script.sh | base64 -w0`.
- **Importing an existing server.** `prevent_install_on_import` defaults to `true`
  so importing the server does not trigger a reinstall when the configured install
  parameters differ from its current state.

## Example

See [`examples/complete/`](examples/complete/).
