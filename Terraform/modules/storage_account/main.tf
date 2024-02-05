resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  access_tier              = var.storage_account_access_tier
  min_tls_version = "TLS1_2"
}

resource "azurerm_storage_share" "share" {
  name                 = "tefnet-share"
  quota                = "50"
  storage_account_name = azurerm_storage_account.sa.name
  depends_on           = [azurerm_storage_account.sa]
}

resource "azurerm_storage_container" "sc" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_blob" "blob_storage" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.sc.name
  type                   = var.blob_type

  depends_on = [azurerm_storage_account.sa, azurerm_storage_container.sc]
}




