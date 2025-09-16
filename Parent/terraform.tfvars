# Resource Group
rg_name  = "rg-dev-apps"
location = "Central India"

# Common Tags
tags = {
  environment = "dev"
  owner       = "saurabh.patel"
  project     = "freelance-apps"
}

# VNet
vnet_name     = "vnet-dev-apps"
address_space = ["10.0.0.0/16"]

# Subnets
subnets = {
  frontend = {
    name           = "snet-frontend"
    address_prefix = "10.0.1.0/24"
  }
  backend = {
    name           = "snet-backend"
    address_prefix = "10.0.2.0/24"
  }
}

# NSG
nsg_name = "nsg-dev-apps"

# App Service Plans (already hardcoded in main.tf, so no need to define here unless you want to make them dynamic)

# frontend Web Apps
frontend_apps = {
  "frontend1" = {
    name = "webapp-frontend1"
  }
  "frontend2" = {
    name = "webapp-frontend2"
  }
  "frontend3" = {
    name = "webapp-frontend3"
  }
}

# frontend Web Apps
backend_apps = {
  "backend1" = {
    name = "webapp-backend1"
  }
  "backend2" = {
    name = "webapp-backend2"
  }
  "backend3" = {
    name = "webapp-backend3"
  }
}

# Key vault

kv_name                       = ""
tenant_id                     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
kv_sku                        = "standard"
kv_soft_delete_retention_days = 7
kv_purge_protection_enabled   = true

# common_tags = {
#   environment = "production"
#   owner       = "saurabh.patel"
#   project     = "freelance-azure"
# }

# for SQL server and DBs

sql_server_name = "saurabh-sql-server"

admin_login    = "sqladminuser"
admin_password = "StrongP@ssw0rd!"

sql_databases = {
  db1 = {
    name        = "saurabh-db1"
    sku_name    = "Basic"
    max_size_gb = 2
    collation   = "SQL_Latin1_General_CP1_CI_AS"
  }
  db2 = {
    name        = "saurabh-db2"
    sku_name    = "Basic"
    max_size_gb = 2
    collation   = "SQL_Latin1_General_CP1_CI_AS"
  }
}

# storage account

# logic app

logic_app_name = "logicapp-standard-dev"