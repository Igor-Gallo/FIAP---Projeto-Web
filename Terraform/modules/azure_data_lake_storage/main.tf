

resource "azurerm_storage_account" "azure_data_lake" {
  name                     = var.account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_replication_type
  is_hns_enabled           = var.is_hns_enabled
  min_tls_version = "TLS1_2"
}