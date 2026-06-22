terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~>2.5"
    }
  }
}
provider "local" {}

resource "local_file" "server_config" {
  filename = "../configs/server-info.yaml"

  content = <<EOF
  server_name: dev-server
  Environment: ${var.environment}
  Timezone: ${var.timezone}
  docker_enabled: true
  monitoring_enabled: true
  EOF
}

resource "local_file" "inventory" {
  filename = "../inventory/inventory.ini"

  content = <<EOF
  [local]
  localhost ansible_connection=local
  EOF
}