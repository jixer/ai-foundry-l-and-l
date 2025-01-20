resource "azurerm_machine_learning_compute_instance" "me" {
  name                          = local.names.ml_owner_workstation
  machine_learning_workspace_id = azapi_resource.hub.id
  virtual_machine_size          = "STANDARD_DS2_V2"
  authorization_type            = "personal"
  description                   = "Azure ML compute resource for primary Owner"

  assign_to_user {
    object_id = data.azurerm_client_config.current.object_id
    tenant_id = data.azurerm_client_config.current.tenant_id
  }
}