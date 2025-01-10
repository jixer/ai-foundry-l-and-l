resource "azurerm_search_service" "this" {
  name                = local.names.ai_search
  location            = var.location
  resource_group_name = azurerm_resource_group.foundry.name
  sku                 = "standard"

  local_authentication_enabled = false
}

// User permissions
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

// AI Services Identity permissions
// ref: https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/on-your-data-configuration#role-assignments
resource "azurerm_role_assignment" "asc_ais_reader" {
  scope                = azurerm_search_service.this.id
  role_definition_name = "Search Index Data Reader"
  principal_id         = azurerm_ai_services.this.identity[0].principal_id
}

resource "azurerm_role_assignment" "asc_ais_contributor" {
  scope                = azurerm_search_service.this.id
  role_definition_name = "Search Service Contributor"
  principal_id         = azurerm_ai_services.this.identity[0].principal_id
}

// App Service Permissions
resource "azurerm_role_assignment" "asc_app_contributor" {
  scope                = azurerm_search_service.this.id
  role_definition_name = "Search Service Contributor"
  principal_id         = azurerm_linux_web_app.promptflow_app.identity[0].principal_id
}

resource "azurerm_role_assignment" "asc_app_reader" {
  scope                = azurerm_search_service.this.id
  role_definition_name = "Search Index Data Reader"
  principal_id         = azurerm_linux_web_app.promptflow_app.identity[0].principal_id
}