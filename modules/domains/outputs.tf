output "zone" {
  description = "DNS zone information"
  value       = data.ovh_domain_zone.zone
}

output "records" {
  description = "Created DNS records"
  value       = ovh_domain_zone_record.records
}

output "name_servers" {
  description = "Configured name servers, or null when left unchanged"
  value       = try(ovh_domain_name_servers.domain[var.zone].servers, null)
}
