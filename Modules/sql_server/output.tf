output "sql_server_id" {
  value = azurerm_mssql_server.sqlserver.id
}

output "sql_database_ids" {
  value = { for db in azurerm_mssql_database.db : db.name => db.id }
}
