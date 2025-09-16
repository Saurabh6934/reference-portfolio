resource "azurerm_linux_web_app" "frontend" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.app_service_plan_id
  tags                = var.tags

  site_config {}
}

resource "azurerm_linux_web_app_slot" "staging" {
  name           = "staging"
  app_service_id = azurerm_linux_web_app.frontend.id

  site_config {}
}

resource "azurerm_linux_web_app_slot" "production" {
  name           = "production"
  app_service_id = azurerm_linux_web_app.frontend.id

  site_config {}
}
