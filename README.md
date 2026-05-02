# opentofu-ovh-modules

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![OpenTofu](https://img.shields.io/badge/OpenTofu-%E2%89%A5%201.6-7B42BC)](https://opentofu.org/)
[![Release Please](https://img.shields.io/badge/release-please-1E90FF)](https://github.com/googleapis/release-please)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-FE5196)](https://www.conventionalcommits.org/)

A collection of [OpenTofu](https://opentofu.org/) modules for provisioning
[OVHcloud](https://www.ovhcloud.com/) resources.

Each module lives under [`modules/`](./modules) and is released independently
with its own version tag.

## Modules

| Module                         | Description                                                              |
|--------------------------------|--------------------------------------------------------------------------|
| [`domains`](./modules/domains) | OVH DNS zone with managed DNS records and optional custom name servers. |

## Usage

Consume a module with the Git source, pinning to a module-scoped tag:

```hcl
module "dns" {
  source = "git::https://github.com/mikinhas/opentofu-ovh-modules.git//modules/domains?ref=domains/v0.1.0"

  # ... module inputs
}
```

Each module's `README.md` documents its inputs, outputs, and runnable example.

## Requirements

- OpenTofu `>= 1.6`
- OVH provider `>= 1.0`
- OVH API credentials exposed as environment variables:
  - `OVH_ENDPOINT` (e.g. `ovh-eu`)
  - `OVH_APPLICATION_KEY`
  - `OVH_APPLICATION_SECRET`
  - `OVH_CONSUMER_KEY`

  Create an application at <https://eu.api.ovh.com/createApp/>.

Individual modules may impose additional requirements — see their README.

## Versioning & releases

Modules are versioned **independently** following [Semantic Versioning](https://semver.org/).
Tags are prefixed with the module name: `domains/v1.2.0`, etc.

Releases are managed by [release-please](https://github.com/googleapis/release-please):
commits following the [Conventional Commits](https://www.conventionalcommits.org/)
specification drive automated version bumps and changelog generation.

Scope your commits with the module name so only that module is bumped:

```text
feat(domains): add support for DNSSEC
fix(domains): correct default for ttl
feat(domains)!: rename variable zone → zones
```

## Contributing

Contributions are welcome. See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for the
commit convention, PR workflow, and release process.

## License

[MIT](./LICENSE)
