variable "resource_group_name" {
  description = "O nome do grupo de recursos"
  type        = string
  default     = "Challenge-TEFNET-RG"
}

variable "vnet_name" {
  description = "O nome da rede virtual"
  type        = string
  default     = "tefnet-vnet"
}

variable "location" {
  description = "A localização dos recursos"
  type        = string
  default     = "eastus"
}

variable "address_space" {
  description = "O espaço de endereço da rede virtual"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "The subnet configurations"
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}

