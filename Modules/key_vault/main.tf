resource "azurerm_key_vault" "this" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.rg_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  tags = var.tags
}