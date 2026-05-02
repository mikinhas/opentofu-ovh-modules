data "ovh_domain_zone" "zone" {
  name = var.zone
}

resource "ovh_domain_zone_record" "records" {
  for_each = var.records

  zone      = var.zone
  subdomain = each.value.subdomain
  fieldtype = each.value.fieldtype
  target    = each.value.target
  ttl       = each.value.ttl
}

resource "ovh_domain_name_servers" "domain" {
  for_each = toset(var.name_servers != null ? [var.zone] : [])

  domain = each.value

  dynamic "servers" {
    for_each = var.name_servers
    content {
      host = servers.value
    }
  }
}
