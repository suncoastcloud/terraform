resource "azurerm_resource_group" "rg" {
  name     = "automation-rg"
  location = var.location
}

resource "azurerm_automation_account" "aa" {
  name                = "automation"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "Basic"

  tags = {
    environment = "dev"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "assign_contributor" {
  principal_id         = azurerm_automation_account.aa.identity[0].principal_id
  role_definition_name = "Contributor"
  scope                = azurerm_automation_account.aa.id
}

data "local_file" "example" {
  filename = "${path.module}/azaccountshow.ps1"
}

resource "azurerm_automation_runbook" "rb" {
  name                    = "AZAccountShow"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  automation_account_name = azurerm_automation_account.aa.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This is an example runbook"
  runbook_type            = "PowerShell72"

  content = data.local_file.example.content
}