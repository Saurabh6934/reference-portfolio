resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  tags                         = var.tags
}

resource "azurerm_mssql_database" "db" {
  for_each            = var.sql_databases
  name                = each.value.name
  server_id           = azurerm_mssql_server.sqlserver.id
  sku_name            = each.value.sku_name
  max_size_gb         = each.value.max_size_gb
  collation           = each.value.collation
  tags                = var.tags
}
