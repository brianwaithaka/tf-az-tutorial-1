# Init
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.6.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Resources
resource "azurerm_resource_group" "example" {
  name     = "tf-test-resourcegroup"
  location = "canadacentral"

}

resource "azurerm_storage_account" "tf-storage-1" {
  name                     = "brianstorageaccount98"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_kind             = "StorageV2"
  access_tier              = "Hot"
  account_replication_type = "LRS"
  account_tier             = "Standard"

}