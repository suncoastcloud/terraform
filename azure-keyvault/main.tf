data "azurerm_client_config" "current" {}

resource "random_pet" "my_pet" {
  prefix = "scc"
  length = 2
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.my_pet.id 
  location = var.location
}

resource "azurerm_key_vault" "kv" {
  name                        = random_pet.my_pet.id
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}