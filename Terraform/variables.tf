


# 5° - Variáveis do Cosmos DB

variable "cosmos_db_account_name" {
  description = "The name of the Cosmos DB account"
  type        = string
  default     = "Tefnetcosmosdb"
}

variable "cosmos_db_database_name" {
  description = "The name of the Cosmos DB database"
  type        = string
  default     = "TefnetDb"
}


# 6° - Variáveis do Custom Vision

variable "custom_vision_name" {
  description = "The name of the Cosmos DB database"
  type        = string
  default     = "Tefnet-Custom-Vision"
}