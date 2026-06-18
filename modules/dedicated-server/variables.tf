variable "service_name" {
  description = "The service_name of your already-delivered dedicated server (e.g. nsXXXXXX.ip-XX-XX-XX.eu). Changing it forces replacement."
  type        = string

  validation {
    condition     = length(trimspace(var.service_name)) > 0
    error_message = "service_name must not be empty."
  }
}

variable "os" {
  description = "Operating system / installation template to install (e.g. debian12_64). List compatible templates via the ovh_dedicated_installation_template data source."
  type        = string

  validation {
    condition     = length(trimspace(var.os)) > 0
    error_message = "os must not be empty."
  }
}

variable "ssh_key" {
  description = "Public SSH key authorized for the installed OS."
  type        = string

  validation {
    condition     = can(regex("^(ssh-(rsa|ed25519)|ecdsa-sha2-|sk-)", var.ssh_key))
    error_message = "ssh_key must be a public key (e.g. starting with ssh-rsa, ssh-ed25519, or ecdsa-sha2-)."
  }
}

variable "hostname" {
  description = "Custom hostname set during installation. Leave null to use OVH's default."
  type        = string
  default     = null
}

variable "post_installation_script" {
  description = "Post-installation script run after the OS is installed. Base64-encoding is recommended (see README)."
  type        = string
  default     = null
}

variable "display_name" {
  description = "Display name of the dedicated server in the OVH manager. Leave null to keep the current name."
  type        = string
  default     = null
}

variable "monitoring" {
  description = "Enable OVH ICMP monitoring on the server."
  type        = bool
  default     = true
}

variable "prevent_install_on_create" {
  description = "Prevent OS installation when the resource is first created. Keep false to install the server on first apply."
  type        = bool
  default     = false
}

variable "prevent_install_on_import" {
  description = "Prevent a reinstallation when the server is imported with installation parameters that differ from its current state. Defaults to true to avoid wiping an imported server."
  type        = bool
  default     = true
}
