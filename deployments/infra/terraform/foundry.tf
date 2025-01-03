resource "azurerm_ai_services" "this" {
  name                  = local.names.ai_services
  location              = var.location
  resource_group_name   = azurerm_resource_group.foundry.name
  sku_name              = "S0"
  custom_subdomain_name = local.names.ai_services

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Acceptance = "Test"
  }
}

// Azure AI Hub
resource "azapi_resource" "hub" {
  type      = "Microsoft.MachineLearningServices/workspaces@2024-04-01-preview"
  name      = local.names.hub
  location  = var.location
  parent_id = azurerm_resource_group.foundry.id

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      description    = "This is my Azure AI hub"
      friendlyName   = "Main ${local.prefix} Hub"
      storageAccount = azurerm_storage_account.default.id
      keyVault       = azurerm_key_vault.default.id
    }
    kind = "Hub"
  }

  lifecycle {
    ignore_changes = [ tags ]
  }
}

// Azure AI Project
resource "azapi_resource" "project" {
  type      = "Microsoft.MachineLearningServices/workspaces@2024-04-01-preview"
  name      = local.names.project
  location  = var.location
  parent_id = azurerm_resource_group.foundry.id

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      description   = "This is my Azure AI project"
      friendlyName  = "Main ${local.prefix} Hub Project"
      hubResourceId = azapi_resource.hub.id
    }
    kind = "Project"
  }
}

// AzAPI AI Services Connection
resource "azapi_resource" "AIServicesConnection" {
  type      = "Microsoft.MachineLearningServices/workspaces/connections@2024-04-01-preview"
  name      = local.prefix
  parent_id = azapi_resource.hub.id

  body = {
    properties = {
      category      = "AIServices",
      target        = azurerm_ai_services.this.endpoint,
      authType      = "AAD",
      isSharedToAll = true,
      metadata = {
        ApiType    = "Azure",
        ResourceId = azurerm_ai_services.this.id
      }
    }
  }
  response_export_values = ["*"]
}

// AzApi AI Search Connection
resource "azapi_resource" "AISearchConnection" {
  type      = "Microsoft.MachineLearningServices/workspaces/connections@2024-04-01-preview"
  name      = azurerm_search_service.this.name
  parent_id = azapi_resource.hub.id

  body = {
    properties = {
      category      = "CognitiveSearch",
      target        = "https://${azurerm_search_service.this.name}.search.windows.net",
      authType      = "AAD",
      isSharedToAll = true,
      metadata = {
        ApiType    = "Azure",
        ResourceId = azurerm_search_service.this.id
      }
    }
  }
  response_export_values = ["*"]
}


// Permissions
resource "azurerm_role_assignment" "ais_all_admin_contributor" {
  scope                = azurerm_resource_group.foundry.id
  role_definition_name = "Cognitive Services Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "ais_admin_contributor" {
  scope                = azurerm_ai_services.this.id
  role_definition_name = "Cognitive Services OpenAI Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "ais_admin_user" {
  scope                = azurerm_ai_services.this.id
  role_definition_name = "Cognitive Services User"
  principal_id         = data.azurerm_client_config.current.object_id
}