

module "resource_group" {
  source = "./modules/resource_group"
}


# 2° - Criação da Storage Account Blob Storage

module "storage_account_static_site" {
  source              = "./modules/storage_account"
  resource_group_name = module.resource_group.resource_group_name
}

# # 3° - Criação da Rede Virtual

# module "vnet" {
#   source = "./modules/vnet"

#   resource_group_name = module.resource_group.resource_group_name
#   vnet_name           = "tefnet-vnet"
#   address_space       = ["10.0.0.0/16"]

#   subnets = {
#     subnet1 = {
#       name             = "tefnet_sn_backend"
#       address_prefixes = ["10.0.1.0/24"]
#     } #,
#     # subnet2 = {
#     #   name             = "tefnet_sn_2"
#     #   address_prefixes = ["10.0.2.0/24"]
#     # },
#     # subnet3 = {
#     #   name           = "tefnet_sn_3"
#     #   address_prefixes = ["10.0.3.0/24"]
#     # },
#     # subnet4 = {
#     #   name           = "tefnet_sn_4"
#     #   address_prefixes = ["10.0.4.0/24"]
#     # }
#   }
# }


# 5° - Criação do API Management Service (APIM)

module "api_management" {
  source              = "./modules/api_management"
  resource_group_name = module.resource_group.resource_group_name

}


# 6° - Criação do Container Backend

module "container_frontend" {
  source = "./modules/container_frontend"

  resource_group_name             = module.resource_group.resource_group_name
  ip_address_type                 = "Public"
  dns_name_label                  = "tefnetdnsfrontend"
  os_type                         = "Linux"
  api_management_service_endpoint = module.api_management.endpoint
  container_image                 = "igorgallo/frontend:final"
  container_name                  = "tefnetcontainerfrontend"
  storage_account_name            = module.storage_account_static_site.storage_account_name
  storage_account_key             = module.storage_account_static_site.storage_account_primary_access_key
  storage_share                   = module.storage_account_static_site.storage_account_share_name


  depends_on = [
    module.api_management
  ]

}


module "container_backend" {
  source = "./modules/container_backend"

  resource_group_name             = module.resource_group.resource_group_name
  ip_address_type                 = "Public"
  dns_name_label2                  = "tefnetdnsbackend"
  os_type                         = "Linux"
  api_management_service_endpoint = module.api_management.endpoint
  container_image2                = "igorgallo/backend:final"
  container_name2                  = "tefnetcontainerbackend"
  storage_account_name            = module.storage_account_static_site.storage_account_name
  storage_account_key             = module.storage_account_static_site.storage_account_primary_access_key
  storage_share                   = module.storage_account_static_site.storage_account_share_name


  depends_on = [
    module.api_management
  ]

}


# # 7° - Criação do Mysql Database

# module "mysql_database" {
#   source = "./modules/Azure_database"

#   // Declaração dos argumentos necessários
#   resource_group_name = module.resource_group.resource_group_name
#   location            = "westus"
# }


# 8° - Criação do Custom Vision

module "custom_vision" {
  source              = "./modules/custom_vision"
  name                = var.custom_vision_name
  location            = "eastus"
  resource_group_name = module.resource_group.resource_group_name
}


# # 9° - Criação do Azure Vault Key

# data "azurerm_client_config" "test" {}

# module "azure_vault_key" {
#   source              = "./modules/azure_vault_key"
#   resource_group_name = module.resource_group.resource_group_name
#   key_vault_name      = "tefnet-key-vault"
#   tenant_id           = data.azurerm_client_config.test.tenant_id
#   object_id = "327534ad-1345-412a-a82e-ebfb18994d09"
# }
