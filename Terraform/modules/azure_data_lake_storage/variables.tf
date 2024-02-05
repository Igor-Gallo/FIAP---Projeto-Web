
variable "account_name" {
  description = "The name of the data lake store account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the data lake store account."
  type        = string
}

variable "location" {
  description = "The location/region in which to create the data lake store account."
  type        = string
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account"
  type        = string
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}

variable "is_hns_enabled" {
  description = "Should the Hierarchical Namespace feature be enabled?"
  type        = bool
  default     = true
}