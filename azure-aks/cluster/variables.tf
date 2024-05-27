variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Kubernetes Service cluster"
  type        = string
  default = "aks-rg"      
}

variable "location" {
  description = "The location in which to create the Azure Kubernetes Service cluster"
  type        = string
  default = "southcentralus"
}

variable "azurerm_kubernetes_cluster_name" {
  description = "The name of the Azure Kubernetes Service cluster"
  type        = string
  default = "aks-cluster"  
}

variable "aks_dns_prefix" {
  description = "The DNS prefix for the Azure Kubernetes Service cluster"
  type        = string
  default = "sccakscluster2434"  
}




