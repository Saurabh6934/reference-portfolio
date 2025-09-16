# to create Resource group

module "resource_group" {
  source   = "../Modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
  tags     = var.tags
}

# to create Virtual Network

module "vnet" {
  source        = "../Modules/vnet"
  vnet_name     = var.vnet_name
  address_space = var.address_space
  location      = var.location
  rg_name       = module.resource_group.rg_name
  tags          = var.tags
  subnets       = var.subnets
}

# to create NSG

module "nsg" {
  source     = "../Modules/nsg"
  nsg_name   = var.nsg_name
  location   = var.location
  rg_name    = module.resource_group.rg_name
  tags       = var.tags
  subnet_ids = module.vnet.subnet_ids
}

# to create Staging frontend ASP

module "asp_frontend_staging" {
  source           = "../modules/app_service_plan"
  app_service_name = "asp-dev-frontend-staging"
  rg_name          = var.rg_name
  location         = var.location
  sku = {
    tier = "PremiumV2"
    size = "P1v2"
  }
  tags = var.tags
}

# to create Production frontend ASP

module "asp_frontend_prod" {
  source           = "../modules/app_service_plan"
  app_service_name = "asp-dev-frontend-prod"
  rg_name          = var.rg_name
  location         = var.location
  sku = {
    tier = "PremiumV2"
    size = "P1v2"
  }
  tags = var.tags
}

# to create Staging backend ASP

module "asp_backend_staging" {
  source           = "../modules/app_service_plan"
  app_service_name = "asp-dev-backend-staging"
  rg_name          = var.rg_name
  location         = var.location
  sku = {
    tier = "PremiumV2"
    size = "P1v2"
  }
  tags = var.tags
}

# to create Production backend ASP

module "asp_backend_prod" {
  source           = "../modules/app_service_plan"
  app_service_name = "asp-dev-backend-prod"
  rg_name          = var.rg_name
  location         = var.location
  sku = {
    tier = "PremiumV2"
    size = "P1v2"
  }
  tags = var.tags
}

# to create frontend webapps

module "frontend_webapps" {
  source              = "../Modules/app_service/frontend_app_service"
  for_each            = var.frontend_apps
  name                = each.value.name
  location            = var.location
  rg_name             = var.rg_name
  app_service_plan_id = module.asp_frontend_prod.app_service_plan_id
  tags                = var.tags
}

# to create backend webapps

module "backend_webapps" {
  source              = "../Modules/app_service/backend_app_service"
  for_each            = var.backend_apps
  name                = each.value.name
  location            = var.location
  rg_name             = var.rg_name
  app_service_plan_id = module.asp_backend_prod.app_service_plan_id
  tags                = var.tags
}

# to create Key vault

module "key_vault" {
  source                     = "../modules/key_vault"
  kv_name                    = var.kv_name
  location                   = var.location
  rg_name                    = var.rg_name
  tenant_id                  = var.tenant_id
  sku_name                   = var.kv_sku
  soft_delete_retention_days = var.kv_soft_delete_retention_days
  purge_protection_enabled   = var.kv_purge_protection_enabled
  tags                       = var.tags
}

# to create SQL server and DB

module "sql_server" {
  source          = "../Modules/sql_server"
  sql_server_name = var.sql_server_name
  rg_name         = var.rg_name
  location        = var.location
  admin_login     = var.admin_login
  admin_password  = var.admin_password
  tags            = var.tags
  sql_databases   = var.sql_databases
}

# to create Storage account

module "storage_account" {
  source               = "../modules/storage_account"
  storage_account_name = var.storage_account_name
  rg_name              = var.rg_name
  location             = var.location
  tags                 = var.tags
}

# to create Logic app


module "logic_app_standard" {
  source                     = "../Modules/logic_app"
  logic_app_name             = var.logic_app_name
  location                   = var.location
  rg_name                    = var.rg_name
  app_service_plan_id        = module.asp_frontend_prod.app_service_plan_id
  storage_account_name       = module.storage_account.storage_account_name
  storage_account_access_key = module.storage_account.storage_account_access_key
  tags                       = var.tags
}









