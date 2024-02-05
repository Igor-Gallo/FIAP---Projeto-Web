
output "frontend_fqdn" {
  value = azurerm_container_group.frontend.fqdn
}

output "ip_frontend" {
    value = azurerm_container_group.frontend.ip_address 
}