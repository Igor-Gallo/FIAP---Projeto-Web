output "prediction_endpoint" {
  description = "The endpoint of the prediction API"
  value       = azurerm_cognitive_account.custom_vision.endpoint
}

output "training_endpoint" {
  description = "The endpoint of the training API"
  value       = azurerm_cognitive_account.custom_vision_training.endpoint
}