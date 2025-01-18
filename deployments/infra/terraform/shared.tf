// STORAGE ACCOUNT
resource "azurerm_storage_account" "default" {
  name                            = local.names.foundry_storage
  location                        = var.location
  resource_group_name             = azurerm_resource_group.foundry.name
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}

// KEY VAULT
resource "azurerm_key_vault" "default" {
  name                      = local.names.foundry_kv
  location                  = var.location
  resource_group_name       = azurerm_resource_group.foundry.name
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "standard"
  purge_protection_enabled  = false
  enable_rbac_authorization = true
}

// User permissions
resource "azurerm_role_assignment" "storage_contributor" {
  scope                = azurerm_storage_account.default.id
  role_definition_name = "Storage Account Contributor"
  principal_id         = data.azurerm_client_config.current.object_id

}

// AI Services Identity permissions
// ref: https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/on-your-data-configuration#role-assignments
resource "azurerm_role_assignment" "storage_ais_contributor" {
  scope                = azurerm_storage_account.default.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_ai_services.this.identity[0].principal_id
}