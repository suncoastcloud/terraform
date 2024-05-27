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
    config_path = "~/.kube/config"
}