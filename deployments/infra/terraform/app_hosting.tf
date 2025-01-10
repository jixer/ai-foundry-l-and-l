resource "azurerm_service_plan" "this" {
  name                = local.names.app_service_plan
  location            = var.location
  resource_group_name = azurerm_resource_group.hosting.name
  os_type             = "Linux"
  sku_name            = var.app_size
}

resource "azurerm_linux_web_app" "promptflow_app" {
  name                = local.names.promptflow_app
  location            = var.location
  resource_group_name = azurerm_resource_group.hosting.name

  service_plan_id = azurerm_service_plan.this.id

  app_settings = {
    AZURE_OPEN_AI_API_KEY               = azurerm_ai_services.this.primary_access_key
    PROMPTFLOW_WORKER_NUM               = 1
    PROMPTFLOW_WORKER_THREADS           = 1
    DOCKER_ENABLE_CI                    = true
    USER_AGENT                          = "promptflow-appservice"
    WEBSITES_CONTAINER_START_TIME_LIMIT = 1800
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    WEBSITES_PORT                       = 8080
  }

  identity {
    type = "SystemAssigned"
  }

  site_config {
    container_registry_use_managed_identity = true
    app_command_line                        = "bash start.sh"
  }

  logs {
    detailed_error_messages = true
    failed_request_tracing  = true
    http_logs {
      file_system {
        retention_in_days = 1
        retention_in_mb   = 35
      }
    }
  }
}