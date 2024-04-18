resource "azurerm_resource_group" "rg" {
  name     = "automation-rg"
  location = var.location
}

resource "azurerm_automation_account" "rg" {
  name                = "automation"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "Basic"

  tags = {
    environment = "dev"
  }

  identity {
    type = "SystemAssigned"
  }
}