variable "rg_name" {}  
variable "location" {}

variable "kv_name" {}

variable "tenant_id" {}

variable "sku_name" {
  description = "SKU name for Key Vault"
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention days"
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Enable purge protection"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for Key Vault"
  type        = map(string)
}