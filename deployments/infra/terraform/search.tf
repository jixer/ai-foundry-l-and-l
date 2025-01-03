resource "azurerm_search_service" "this" {
  name                = local.names.ai_search
  location              = var.location
  resource_group_name   = azurerm_resource_group.foundry.name
  sku                 = "standard"

  local_authentication_enabled = false
}

// Permissions
resource "azurerm_role_assignment" "asc_admin_contributor" {
  scope                = azurerm_search_service.this.id
  role_definition_name = "Cognitive Services Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "asc_admin_index_contributor" {
  scope                = azurerm_search_service.this.id
  role_definition_name = "Search Index Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}