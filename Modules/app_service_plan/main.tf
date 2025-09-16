resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.rg_name  

  sku {
    tier = var.sku.tier
    size = var.sku.size
  }

  kind     = "Linux"
  reserved = true

  tags = var.tags
}
