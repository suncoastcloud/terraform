# Random resource group name

resource "random_pet" "rg_name" {
  prefix = "scc"
}

# Random storage account name

resource "random_id" "storage_account" {
  byte_length = 8
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg_name.id
  location = var.resource_group_location
}

resource "azurerm_storage_account" "sa" {
  name                     = "scc${lower(random_id.storage_account.hex)}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
