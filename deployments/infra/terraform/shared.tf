// STORAGE ACCOUNT
resource "azurerm_storage_account" "default" {
  name                            = local.names.foundry_storage
  location                        = var.location
  resource_group_name             = azurerm_resource_group.foundry.name
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  allow_nested_items_to_be_public = false
}

// KEY VAULT
resource "azurerm_key_vault" "default" {
  name                     = local.names.foundry_kv
  location                 = var.location
  resource_group_name      = azurerm_resource_group.foundry.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "standard"
  purge_protection_enabled = false
}