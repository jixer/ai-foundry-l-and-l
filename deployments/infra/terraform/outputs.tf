output "azure_region" {
  value = var.location
}

output "foundry_resource_group" {
  value = azurerm_resource_group.foundry.name
}

output "apps_resource_group" {
  value = azurerm_resource_group.hosting.name
}

output "ais_endpoint" {
  value = azurerm_ai_services.this.endpoint
}

output "ais_openai_endpoint" {
  value = replace(azurerm_ai_services.this.endpoint, "cognitiveservices", "openai")
}

output "ai_search" {
  value = azurerm_search_service.this
  sensitive = true
}