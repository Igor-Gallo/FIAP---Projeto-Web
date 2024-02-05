terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tefnet-tfstate-rg"
    storage_account_name = "tefnetstateblob"
    container_name       = "tefnetstate"
    key                  = "tefnet.tfstate"
  }
}



provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  skip_provider_registration = true
}






































































# client_id       = "a6333b73-12b6-44eb-bde2-7504484081cc"
# client_secret   = "y4x8Q~I60N3.WxiNndGKGsGgi-SNxjj2RdsomcmK"
# tenant_id       = "4208863c-573f-4b4d-9ada-4492db627ba1"
# subscription_id = "1dfbfdea-75fa-4ea8-899f-29e6c0f3e666"
