variable "container_name" {
  description = "Name of the container"
  type        = string
  default = "tefnetfrontend"
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the container group."
  type        = string
}

variable "ip_address_type" {
  description = "The IP address type of the container group."
  type        = string
  default     = "public"
}

variable "dns_name_label" {
  description = "DNS name label for the container"
  type        = string
  default     = "tefnetdnsfrontend"
}

variable "os_type" {
  description = "The OS type of the container."
  type        = string
  default     = "Linux"
}



variable "container_frontend_name" {
  description = "Name of the container backend"
  type        = string
  default     = "tefnetcontainerfrontend"
}

variable "container_image" {
  description = "The name of the image used to create the container instance."
  type        = string
}

variable "container_cpu" {
  description = "The number of CPUs allocated to the container instance."
  type        = number
  default     = 2
}

variable "container_memory" {
  description = "The amount of memory allocated to the container instance in GB."
  type        = number
  default     = 4
}

variable "storage_account_name"{}

variable "storage_account_key"{}

variable "storage_share" {}

variable "api_management_service_endpoint" {}