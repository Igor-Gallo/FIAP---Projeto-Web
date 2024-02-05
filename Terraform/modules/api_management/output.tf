
output "api_management_id" {
  value       = azurerm_api_management.api_management.id
  description = "The ID of the created API Management service."
}

output "endpoint" {
  value       = azurerm_api_management.api_management.gateway_url
  description = "The gateway URL of the API Management service."
}