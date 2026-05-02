output "zone" {
  description = "DNS zone information"
  value       = module.dns.zone
}

output "records" {
  description = "Created DNS records"
  value       = module.dns.records
}

output "name_servers" {
  description = "Configured name servers (null when left unchanged)"
  value       = module.dns.name_servers
}
