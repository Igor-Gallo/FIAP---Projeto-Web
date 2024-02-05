variable "storage_account_name" {
  type        = string
  description = "Name of the Azure Storage Account"
  default = "tefnetstorageaccount"
}

variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group."
}

variable "location" {
  description = "The location/region where the virtual network is created."
  type        = string
  default = "eastus"
}

variable "storage_account_tier" {
  type        = string
  description = "Azure Storage Account Tier."
  default = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Azure Storage Account Replication Type."
  default = "LRS"
}

variable "storage_account_access_tier" {
  type        = string
  description = "Azure STorage Account Access Tier."
  default = "Hot"
}

variable "storage_container_name" {
  type        = string
  description = "Name of the Blob container."
  default = "tefnetecs"
}

variable "storage_container_access_type" {
  type        = string
  description = "Blob Container Access Type."
  default = "private"
}

variable "blob_name" {
  type        = string
  description = "The name of the storage blob."
  default = "blobtefnetfrontend"
}

variable "blob_type" {
  description = "The type of the storage blob."
  default = "Block"
}