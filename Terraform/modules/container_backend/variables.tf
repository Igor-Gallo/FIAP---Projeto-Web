variable "container_name2" {
  description = "Name of the container"
  type        = string
  default = "backendcontainer"
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
  default     = "Private"
}

variable "dns_name_label2" {
  description = "DNS name label for the container"
  type        = string
  default     = "tefnetdnsbackend"
}

variable "os_type" {
  description = "The OS type of the container."
  type        = string
  default     = "Linux"
}



# 4° - Variáveis do Container backend

variable "container_backend_name" {
  description = "Name of the container backend"
  type        = string
  default     = "tefnetcontainerbackend"
}

variable "container_image2" {
  description = "The name of the image used to create the container instance."
  type        = string
}

variable "container_backend_cpu" {
  description = "CPU cores for the container backend"
  type        = number
  default     = 2
}

variable "container_backend_memory" {
  description = "Memory for the container backend"
  type        = number
  default     = 4
}


variable "storage_account_name"{}

variable "storage_account_key"{}

variable "storage_share" {}

variable "api_management_service_endpoint" {}