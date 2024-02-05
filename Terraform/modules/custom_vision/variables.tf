
variable "name" {
  description = "The name of the cognitive account."
  type        = string
}

variable "location" {
  description = "The location/region where the cognitive account is created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the cognitive account."
  type        = string
}