provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used

  subscription_id = var.SubscriptionId
  client_id       = var.Client_Id
  client_secret   = var.Client_Secret
  tenant_id       = var.tenant_id

  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.Resource_group_name
  location = var.Location_name
}
# Create virtual network
resource "azurerm_storage_account" "example1" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}
