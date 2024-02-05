variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}



# 3° - Variáveis do API Management

variable "api_management_name" {
  type        = string
  description = "O nome do serviço de gerenciamento de API."
  default     = "challenge-tefnet-apim"
}

variable "location" {
  description = "A localização dos recursos"
  type        = string
  default     = "eastus"
}


variable "publisher_name" {
  type        = string
  description = "O nome da sua organização (para uso no portal do desenvolvedor)."
  default     = "TEFNET"
}

variable "publisher_email" {
  type        = string
  description = "O endereço de e-mail associado à sua organização."
  default     = "srheadshoot@outlook.com"
}

variable "sku_name" {
  type        = string
  description = "O SKU do serviço de gerenciamento de API."
  default     = "Consumption_0"
}

variable "identity_type" {
  description = "The type of managed service identity."
  type        = string
  default     = "SystemAssigned"
}