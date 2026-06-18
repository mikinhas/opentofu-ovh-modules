resource "ovh_dedicated_server" "this" {
  service_name = var.service_name
  os           = var.os

  customizations = {
    hostname                 = var.hostname
    ssh_key                  = var.ssh_key
    post_installation_script = var.post_installation_script
  }

  display_name = var.display_name
  monitoring   = var.monitoring

  prevent_install_on_create = var.prevent_install_on_create
  prevent_install_on_import = var.prevent_install_on_import
}
