variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default = "myVNet"
}

variable "vnet_address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "vnet_location" {
  description = "Location of the virtual network"
  type        = string
  default     = "southcentralus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default = "myResourceGroup"
}