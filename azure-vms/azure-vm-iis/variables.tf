variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}

# need to re-engineer the client and secret for use in key vaults. These are false values

variable "ARM_CLIENT_ID" {
  default     = "1234"
  description = "Azure Service Principal Client ID"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  default     = "1234"
  description = "Azure Service Principal Client Secret"
  type        = string
}

variable "ARM_TENANT_ID" {
  default     = "f2455d0c-6e63-4ada-a0ef-7f2b7891d619"
  description = "Azure Tenant ID"
  type        = string
}

variable "ARM_SUBSCRIPTION_ID" {
  default     = "a5edabc6-a664-415a-abb8-0ee5d15cf37e"
  description = "Azure Subscription ID"
  type        = string
}
