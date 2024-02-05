resource "azurerm_container_group" "backend" {
  name                = var.container_name2
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = var.ip_address_type
  dns_name_label      = var.dns_name_label2
  restart_policy      = "OnFailure"
  os_type             = "Linux"

  container {
    name   = var.container_backend_name
    image  = "igorgallo/backend:final"
    cpu    = var.container_backend_cpu
    memory = var.container_backend_memory

    ports {
      port     = 80
      protocol = "TCP"
    }

    ports {
      port     = 443
      protocol = "TCP"
    }

    ports {
      port     = 3001
      protocol = "TCP"
    }

    ports {
      port     = 3000
      protocol = "TCP"
    }

    # volume {
    #   name       = "volume-backend"
    #   mount_path = "/mnt/tefnet"  # Path where you want to mount the volume in the container
    #   share_name        = var.storage_share # Please replace with your Azure File Share Name
    #   storage_account_name = var.storage_account_name   # Assuming you have this variable defined
    #   storage_account_key  = var.storage_account_key    # Assuming you have this variable defined
    # }

        environment_variables = {
      "API_MANAGEMENT_SERVICE_ENDPOINT" = var.api_management_service_endpoint
  }
}
}