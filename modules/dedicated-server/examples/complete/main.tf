module "server" {
  source = "../.."

  service_name = "nsXXXXXX.ip-XX-XX-XX.eu"
  os           = "debian12_64"
  ssh_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAExampleKeyReplaceMe you@host"

  hostname     = "tux"
  display_name = "prod-app-01"
  monitoring   = true

  # Optional: run a post-installation script (base64-encoded is recommended).
  # Encode with: cat my-script.sh | base64 -w0
  #
  # post_installation_script = "IyEvYmluL2Jhc2gKZWNobyBoZWxsbwo="
}
