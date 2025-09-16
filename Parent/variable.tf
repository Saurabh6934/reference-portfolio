variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "nsg_name" {
  type = string
}



variable "frontend_apps" {
  type = map(object({
    name = string
  }))
}

variable "backend_apps" {
  type = map(object({
    name = string
  }))
}

variable "kv_name" {
  type        = string
  description = "Key Vault name"
}

variable "tenant_id" {
  type        = string
  description = "Azure AD Tenant ID"
}

variable "kv_sku" {
  type    = string
  default = "standard"
}

variable "kv_soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "kv_purge_protection_enabled" {
  type    = bool
  default = true
}


# for SQL server and DB

variable "sql_server_name" {
  type = string
}

variable "admin_login" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}


variable "sql_databases" {
  type = map(object({
    name        = string
    sku_name    = string
    max_size_gb = number
    collation   = string
  }))
}

# storage account

variable "storage_account_name" {}

# logic app

variable "logic_app_name" {}
