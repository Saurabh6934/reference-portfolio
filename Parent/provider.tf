terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
  #   backend "azurerm" {
  #   subscription_id      = "XXXXXXXXXXXXXXXXXXXXXXXX"
  #   resource_group_name  = "XXXXXXXXXXXXXXXXX"
  #   storage_account_name = "XXXXXXXXXX"
  #   container_name       = "XXXXXXXXXX"
  #   key                  = "XXXXXXXXXX"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "239f86cf-d0d2-4954-935f-40e39253100c"
}