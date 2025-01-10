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

output "openai_endpoint" {
  value = replace(azurerm_ai_services.this.endpoint, "cognitiveservices", "openai")
}

output "search_endpoint" {
  value = "https://${azurerm_search_service.this.name}.search.windows.net"
}

output "container_registry" {
  value = "${azurerm_container_registry.acr.name}.azurecr.io"
}

output "promptflow_app" {
  value = azurerm_linux_web_app.promptflow_app.name
}