resource "azurerm_container_registry" "acr" {
  name                = local.names.container_registry
  resource_group_name = azurerm_resource_group.hosting.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
}

resource "azurerm_role_assignment" "acr_app_images" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_web_app.promptflow_app.identity[0].principal_id
}