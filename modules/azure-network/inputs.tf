variable "vnet_name" {
  description = "Name of the virtual network"
  type        = list(string)
  default = "myVNet"
}
variable "subnet_names" {
  description = "Names of the subnets"
  type        = list(string)
  default     = "subnet1"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of the subnets"
  type        = list(string)
  default     = "10.0.1.0/24"
}

variable "subnet_nsgs" {
  description = "Network Security Groups associated with the subnets"
  type        = list(string)
  default     = "nsg1"
}
variable "vnet_address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
  default     = "10.0.0.0/16"
}

variable "vnet_location" {
  description = "Location of the virtual network"
  type        = list(string)
  default     = "southcentralus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = list(string)
  default = "myResourceGroup"
}