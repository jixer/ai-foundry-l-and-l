resource "azurerm_container_registry" "acr" {
  name                = local.names.container_registry
  resource_group_name = azurerm_resource_group.hosting.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
}