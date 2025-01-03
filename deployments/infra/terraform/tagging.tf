locals {
  prefix = format("%s-azaipoc", var.name_prefix)

  t = {
    resource_group = "rg"
    storage        = "stg"
    key_vault      = "kv"
    ai_services    = "ais"
    hub            = "aih"
    project        = "aip"
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

    hosting_rg = "${local.p.hosting}-${local.t.resource_group}"
  }

  common_tags = {
    owner       = var.owner
    environment = var.environment
  }
}