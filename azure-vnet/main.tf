// calls vnet module from modules folder in this repository

module "vnet_module" {
    source             = "../modules/vnet"   
    vnet_name = "vnet_module"
    vnet_address_space = ["10.0.0.0/16"]
    vnet_location = "southcentralus"
    resource_group_name = "modules-rg"
}