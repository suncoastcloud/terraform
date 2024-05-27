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

# pulls the current context from the kubeconfig file (sccakscluster2434)
provider "kubernetes" {
    config_path = "~/.kube/config"
    config_context = "current"
}