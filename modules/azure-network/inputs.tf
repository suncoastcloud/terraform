variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
  default     = "my-vnet"
}

variable "address_space" {
  type        = list(string)
  description = "The address space of the virtual network"
  default     = ["10.0.0.0/16"]
}

variable "location" {
  type        = string
  description = "The location of the virtual network"
  default     = "southcentralus"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = "modules-rg"
}

