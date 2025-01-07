resource "azurerm_resource_group" "foundry" {
  name     = local.names.foundry_rg
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "hosting" {
  name     = local.names.hosting_rg
  location = var.location
  tags     = local.common_tags
}