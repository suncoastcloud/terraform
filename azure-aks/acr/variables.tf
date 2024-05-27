variable "resource_group_name" {
  description = "The name of the resource group in which to create the ACR instance."   
    type        = string
    default     = "aks-rg"  
}

variable "resource_group_location" {
  description = "The location of the resource group in which to create the ACR instance."   
    type        = string
    default     = "southcentralus"        
}

variable "acr_name" {
  description = "The name of the Azure Container Registry instance."   
    type        = string
    default     = "aksacr"        
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry instance."   
    type        = string
    default     = "Basic"   
}

