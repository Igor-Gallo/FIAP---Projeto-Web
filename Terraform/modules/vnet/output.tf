output "subnet_ids" {
  description = "O ID das subnets"
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}

output "nsg_ids" {
  description = "O ID dos grupos de segurança da rede"
  value       = { for k, v in azurerm_network_security_group.nsg : k => v.id }
}

output "network_profile_id" {
  description = "The ID of the Network Profile"
  value       = azurerm_network_profile.vnet_profile.id
}