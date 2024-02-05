resource "azurerm_resource_group" "rg" {
    name  = var.resource_group_name
    location = var.location
}

resource "azurerm_management_lock" "lock" {
  count      = var.create_lock
  name       = "${var.resource_group_name}-lock"
  scope      = azurerm_resource_group.rg.id
  lock_level = var.locklevel
}