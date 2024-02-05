output "storage_account_name" {
  value = azurerm_storage_account.sa.name
  description = "The name of the created storage account."
}

output "storage_account_primary_access_key" {
    value = azurerm_storage_account.sa.primary_access_key
}

output "storage_account_share_name" {
    value = azurerm_storage_share.share.name
}
