locals {
  prefix = format("%s-azaipoc", var.name_prefix)

  t = {
    resource_group      = "rg"
    storage             = "stg"
    key_vault           = "kv"
    ai_services         = "ais"
    hub                 = "aih"
    project             = "aip"
    ai_search           = "srch"
    container_registry  = "acr"
    app_service_plan    = "asp"
    app                 = "app"
    ml_online_endpoint  = "mle"
    ml_compute_instance = "mlc"
  }

  p = {
    foundry = "${local.prefix}-ai"
    hosting = "${local.prefix}-apps"
  }

  names = {
    foundry_rg           = "${local.p.foundry}-${local.t.resource_group}"
    foundry_storage      = replace("${local.p.foundry}-${local.t.storage}", "-", "")
    foundry_kv           = replace("${local.p.foundry}-${local.t.key_vault}", "-", "")
    ai_services          = "${local.p.foundry}-${local.t.ai_services}"
    hub                  = "${local.p.foundry}-${local.t.hub}-001"
    project              = "${local.p.foundry}-${local.t.project}-001"
    ai_search            = "${local.p.foundry}-${local.t.ai_search}"
    ml_endpoint          = "${local.p.foundry}-${local.t.ml_online_endpoint}-001"
    ml_owner_workstation = "${local.p.foundry}-${local.t.ml_compute_instance}-owner"

    hosting_rg         = "${local.p.hosting}-${local.t.resource_group}"
    container_registry = replace("${local.p.hosting}-${local.t.container_registry}", "-", "")
    app_service_plan   = "${local.p.hosting}-${local.t.app_service_plan}"
    promptflow_app     = "${local.p.hosting}-${local.t.app}-pf-001"
  }

  common_tags = {
    owner       = var.owner
    environment = var.environment
  }
}