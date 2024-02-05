variable "resource_group_name" {
  description = "The name of an existing resource group to be imported."
  type        = string
  default = "Tefnet-Challenge"
}

variable "location" {
  description = "The location/region where the virtual network is created."
  type        = string
  default = "eastus"
}

variable "create_lock" {
  description = "Should an Azure Management Lock being created?"
  type        = number
  default     = 0
}

variable "locklevel" {
  description = "Lock level for the resource group."
  type        = string
  default     = "CanNotDelete"
}