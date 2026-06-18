output "ip" {
  description = "Primary IPv4 address of the server"
  value       = module.server.ip
}

output "state" {
  description = "Administrative state of the server"
  value       = module.server.state
}

output "boot_id" {
  description = "Boot id currently configured"
  value       = module.server.boot_id
}

output "os" {
  description = "Operating system installed on the server"
  value       = module.server.os
}
