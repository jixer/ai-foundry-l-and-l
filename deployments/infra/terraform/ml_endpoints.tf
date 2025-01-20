resource "azapi_resource" "ml_online_endpoint" {
  type      = "Microsoft.MachineLearningServices/workspaces/onlineEndpoints@2024-10-01"
  name      = local.names.hub
  location  = var.location
  parent_id = azapi_resource.project.id

  identity {
    type = "SystemAssigned"
  }

  body = {
    sku = {
      name = "STANDARD_DS2_V2"
    }
    properties = {
      authMode = "Key"
    }
  }
}