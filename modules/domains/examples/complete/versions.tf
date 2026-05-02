terraform {
  required_version = ">= 1.6.0"

  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = ">= 1.0.0"
    }
  }
}

provider "ovh" {
  endpoint = "ovh-eu"
}
