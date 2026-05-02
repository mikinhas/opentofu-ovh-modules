variable "zone" {
  description = "DNS zone to manage"
  type        = string
}

variable "records" {
  description = "DNS records to create, keyed by a stable identifier"
  type = map(object({
    subdomain = optional(string, "")
    fieldtype = string
    target    = string
    ttl       = optional(number, 3600)
  }))
  default = {}
}

variable "name_servers" {
  description = "Custom name servers for the domain. Leave null to keep OVH's existing name servers unchanged."
  type        = list(string)
  default     = null

  validation {
    condition     = var.name_servers == null || try(length(var.name_servers) >= 2 && length(var.name_servers) <= 8, false)
    error_message = "name_servers must contain between 2 and 8 entries when set."
  }

  validation {
    condition     = var.name_servers == null || alltrue([for ns in coalesce(var.name_servers, []) : !endswith(ns, ".")])
    error_message = "name_servers entries must not end with a dot."
  }
}
