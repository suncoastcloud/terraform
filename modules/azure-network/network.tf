resource "azurerm_virtual_network" "vnet_module" {
    name                = var.vnet_name
    address_space       = var.vnet_address_space
    location            = var.vnet_location
    resource_group_name = var.resource_group_name
}

