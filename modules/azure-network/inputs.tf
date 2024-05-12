variable "name" {
  description = "Name of the virtual network"
  type        = string
  default = "myVNet"
}

variable "address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "location" {
  description = "Location of the virtual network"
  type        = string
  default     = "southcentralus"
}

variable "vnets" {
  description = "A map of virtual networks"
  type        = map(any)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default = "myResourceGroup"
}