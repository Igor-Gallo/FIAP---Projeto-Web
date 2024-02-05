output "backend_fqdn" {
  value = azurerm_container_group.backend.fqdn
}

output "ip_backend" {
    value = azurerm_container_group.backend.ip_address 
}