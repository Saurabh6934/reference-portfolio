variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "sql_server_name" {
  type        = string
  description = "Name of the SQL Server"
}

variable "admin_login" {
  type        = string
}

variable "admin_password" {
  type        = string
  sensitive   = true
}


variable "sql_databases" {
  type = map(object({
    name         = string
    sku_name     = string
    max_size_gb  = number
    collation    = string
  }))
}
