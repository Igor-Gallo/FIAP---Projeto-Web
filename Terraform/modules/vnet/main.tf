resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

# Recursos de Subnets
resource "azurerm_subnet" "subnet" {
  depends_on             = [azurerm_virtual_network.vnet]
  for_each               = var.subnets
  name                   = each.value.name
  resource_group_name    = var.resource_group_name
  virtual_network_name   = var.vnet_name
  address_prefixes       = each.value.address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  for_each              = var.subnets
  name                  = "${each.key}-nsg"
  location              = var.location
  resource_group_name   = var.resource_group_name
  depends_on            = [azurerm_subnet.subnet]
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  for_each                    = var.subnets
  subnet_id                   = azurerm_subnet.subnet[each.key].id
  network_security_group_id   = azurerm_network_security_group.nsg[each.key].id
}


resource "azurerm_network_profile" "vnet_profile" {
  name                = "vnet-network-profile"
  location            = var.location
  resource_group_name = var.resource_group_name

  container_network_interface {
    name = "vnet-container-nic"

    ip_configuration {
      name      = "backend-container-ip-config"
      subnet_id = azurerm_subnet.subnet["subnet1"].id
    }
  }
}