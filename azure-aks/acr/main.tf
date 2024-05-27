resource azurerm_resource_group rg {
    name     = var.resource_group_name
    location = var.resource_group_location
}

resource azurerm_container_registry acr {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_sku
  admin_enabled       = true
}

resource null_resource docker_build {
  provisioner local-exec {
    command = "docker build -t ${azurerm_container_registry.acr.login_server}/nginx:v1 ."
  }
  triggers = {
    build_trigger = timestamp()
  }
}

resource null_resource docker_push {
  depends_on = [null_resource.docker_build]
  provisioner local-exec {
    command = "az acr login --name ${azurerm_container_registry.acr.name} && docker push ${azurerm_container_registry.acr.login_server}/nginx:v1"
  }
    triggers = {
        push_trigger = timestamp()
    }
}