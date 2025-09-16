variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the VNet"
}

variable "location" {
  type        = string
}

variable "rg_name" {
  type        = string
}

variable "tags" {
  type        = map(string)
}

variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
