resource "random_pet" "my_pet" {
  prefix = "scc"
  length = 2
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.my_pet.id
  location = var.location
}

resource "azurerm_automation_account" "rg" {
  name                = random_pet.my_pet.id
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