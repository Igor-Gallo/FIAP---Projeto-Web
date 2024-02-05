
resource "azurerm_container_group" "frontend" {
  name                = var.container_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = var.ip_address_type
  dns_name_label      = var.dns_name_label
  restart_policy      = "OnFailure"
  os_type             = "Linux"

  container {
    name   = var.container_frontend_name
    image  = "igorgallo/frontend:final"
    cpu    = var.container_cpu
    memory = var.container_memory

    ports {
      port     = 80
      protocol = "TCP"
    }

    ports {
      port     = 443
      protocol = "TCP"
    }

    ports {
      port     = 3000
      protocol = "TCP"
    }

    ports {
      port     = 3001
      protocol = "TCP"
    }

    # volume {
    #   name       = "volume-frontend"
    #   mount_path = "/mnt/tefnet"  # Path where you want to mount the volume in the container
    #   share_name        = var.storage_share  # Please replace with your Azure File Share Name
    #   storage_account_name = var.storage_account_name   # Assuming you have this variable defined
    #   storage_account_key  = var.storage_account_key    # Assuming you have this variable defined

    # }
        environment_variables = {
      "API_MANAGEMENT_SERVICE_ENDPOINT" = var.api_management_service_endpoint
  }
  }
}