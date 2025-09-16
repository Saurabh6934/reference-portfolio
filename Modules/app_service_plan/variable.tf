variable "app_service_name" {}
variable "rg_name" {}  
variable "location" {}
variable "sku" {
  type = object({
    tier = string
    size = string
  })
}
variable "tags" {
  type = map(string)
}
