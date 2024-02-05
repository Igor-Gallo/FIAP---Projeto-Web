# 5° - Variáveis do Cosmos DB

variable "location" {
  description = "The location/region where the Cosmos DB account is created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Cosmos DB account."
  type        = string
}
