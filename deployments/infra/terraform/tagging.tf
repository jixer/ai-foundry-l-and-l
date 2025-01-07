locals {
  prefix = format("%s-azaipoc", var.name_prefix)

  t = {
    resource_group     = "rg"
    storage            = "stg"
    key_vault          = "kv"
    ai_services        = "ais"
    hub                = "aih"
    project            = "aip"
    ai_search          = "srch"
    container_registry = "acr"
  }

  p = {
    foundry = "${local.prefix}-ai"
    hosting = "${local.prefix}-apps"

  }

  names = {
    foundry_rg      = "${local.p.foundry}-${local.t.resource_group}"
    foundry_storage = replace("${local.p.foundry}-${local.t.storage}", "-", "")
    foundry_kv      = replace("${local.p.foundry}-${local.t.key_vault}", "-", "")
    ai_services     = "${local.p.foundry}-${local.t.ai_services}"
    hub             = "${local.p.foundry}-${local.t.hub}-001"
    project         = "${local.p.foundry}-${local.t.project}-001"
    ai_search       = "${local.p.foundry}-${local.t.ai_search}"

    hosting_rg         = "${local.p.hosting}-${local.t.resource_group}"
    container_registry = replace("${local.p.hosting}-${local.t.container_registry}", "-", "")
  }

  common_tags = {
    owner       = var.owner
    environment = var.environment
  }
}