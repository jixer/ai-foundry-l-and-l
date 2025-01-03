resource "azurerm_cognitive_deployment" "gpt_4o_mini" {
  name                 = "gpt-4o-mini"
  cognitive_account_id = azurerm_ai_services.this.id

  model {
    format  = "OpenAI"
    name    = "gpt-4o-mini"
    version = "2024-07-18"
  }

  sku {
    name = "GlobalStandard"
  }

  rai_policy_name = "Microsoft.DefaultV2"
}