
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

provider "azurerm" {
  alias="config"
  features {}
}

# creación de resource group
resource "azurerm_resource_group" "azcp2rg" {
  name = "kubernetes_rscgcp2"
  location = var.location #definido en correccion.vars
  tags = {
    environment = "cp2"
  }
}

# creación de storage account
resource "azurerm_storage_account" "azcp2stacnt" {
    name                     = var.storage_account #definido en correccion.vars
    resource_group_name      = azurerm_resource_group.azcp2rg.name
    location                 = azurerm_resource_group.azcp2rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "cp2"
    }

}