resource "azurerm_service_plan" "this" {
  name                = local.names.app_service_plan
  location            = var.location
  resource_group_name = azurerm_resource_group.hosting.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "promptflow_app" {
  name                = local.names.promptflow_app
  location            = var.location
  resource_group_name = azurerm_resource_group.hosting.name

  service_plan_id = azurerm_service_plan.this.id

  identity {
    type = "SystemAssigned"
  }

  site_config {}
}