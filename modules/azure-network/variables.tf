// common variables

variable location {
  type        = string
  description = "The location of the virtual network"
  default     = "southcentralus"
}

variable resource_group_name {
  type        = string
  description = "The name of the resource group"
  default     = "modules-rg"
}

variable tags {
  type        = map(string)
  description = "The tags for the resources"
  default     = {
    "terraform" = "managed"
  }
}

// vnet variables

variable vnet_name {
  type        = string
  description = "The name of the virtual network"
  default     = "vnet"
}

variable address_space {
  type        = list(string)
  description = "The address space of the virtual network"
  default     = ["10.0.0.0/16"]
}

// subnet variables

variable subnet_name {
  type        = string
  description = "The name of the subnet"
  default     = "subnet"
}

variable subnet_address_prefixes {
  type        = list(string)
  description = "The address prefixes of the subnet"
  default     = []
  
}

// nsg variables

variable nsg_name {
  type        = string
  description = "The name of the network security group"
  default     = "nsg"
}

variable nsg_rules {
  type        = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "The rules for the network security group"
  default     = [
    {
      name                       = "allow-ssh"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "allow-http"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
  
}
