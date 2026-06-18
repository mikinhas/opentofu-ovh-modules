output "service_name" {
  description = "The service_name of the dedicated server"
  value       = ovh_dedicated_server.this.service_name
}

output "name" {
  description = "Dedicated server name"
  value       = ovh_dedicated_server.this.name
}

output "ip" {
  description = "Dedicated server primary IPv4 address"
  value       = ovh_dedicated_server.this.ip
}

output "region" {
  description = "Region where the server is located"
  value       = ovh_dedicated_server.this.region
}

output "datacenter" {
  description = "Datacenter where the server is located"
  value       = ovh_dedicated_server.this.datacenter
}

output "state" {
  description = "Administrative state of the server (ok, error, hacked, hackedBlocked)"
  value       = ovh_dedicated_server.this.state
}

output "power_state" {
  description = "Power state of the server (poweron, poweroff)"
  value       = ovh_dedicated_server.this.power_state
}

output "boot_id" {
  description = "Boot id currently configured for the server"
  value       = ovh_dedicated_server.this.boot_id
}

output "os" {
  description = "Operating system installed on the server"
  value       = ovh_dedicated_server.this.os
}

output "display_name" {
  description = "Display name of the dedicated server"
  value       = ovh_dedicated_server.this.display_name
}
