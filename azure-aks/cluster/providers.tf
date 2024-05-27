terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "kubernetes" {
    config_context_cluster = azurerm_kubernetes_cluster.aks.kube_config[0].cluster
}
