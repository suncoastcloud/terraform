// calls vnet module from a public repository

module "vnet_module" {
    source = "github.com/suncoastcloud/terraform//modules/azure-network"
    vnet_name = "vnet_module"
    vnet_address_space = ["10.0.0.0/16"]
    vnet_location = "southcentralus"
    resource_group_name = "modules-rg"
}