
resource "azurerm_cognitive_account" "custom_vision" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind    = "CustomVision.Prediction"
  sku_name            = "S0"
}

resource "azurerm_cognitive_account" "custom_vision_training" {
  name                = "${var.name}-training"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind    = "CustomVision.Training"
  sku_name            = "S0"
}