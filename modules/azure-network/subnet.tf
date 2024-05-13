resource azurerm_subnet this{
    name                = var.subnet_name
    address_prefixes    = var.subnet_address_prefixes
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.this.name
}