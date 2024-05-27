#!/bin/bash

# This script builds an nginx Docker image, creates an Azure Container Registry, and then pushes the image to it

# Build the Docker image with the Dockerfile in the current directory
docker build -t my-nginx-image .

# Set variables 
resourceGroup="aks-rg" 
location="southcentralus" 
containerRegistryName="scccontainerregistry2434" 
dockerImageName="my-nginx-image"
aksClusterName="sccakscluster2434"

# Create the resource group
az group create -n $resourceGroup -l $location

# Create the container registry
az acr create --resource-group $resourceGroup --name $containerRegistryName --sku Basic

# Log in to the container registry
az acr login --name $containerRegistryName

# Tag the Docker image with the container registry URL
docker tag $imageName $containerRegistryName.azurecr.io/$dockerImageName

# Push the Docker image to the container registry
docker push $containerRegistryName.azurecr.io/$dockerImageName

# Create an AKS cluster
az aks create --resource-group $resourceGroup --name $aksClusterName --node-count 3 --enable-addons monitoring --generate-ssh-keys

# Connect to the AKS cluster
az aks get-credentials --resource-group $resourceGroup --name $aksClusterName

# Deploy the application
kubectl create deployment nginx-deployment --image=$containerRegistryName.azurecr.io/$dockerImageName
kubectl scale deployment nginx-deployment --replicas=3
kubectl expose deployment nginx-deployment --type=LoadBalancer --port=80

# Access the application
kubectl get service nginx-deployment