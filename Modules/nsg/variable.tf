variable "nsg_name" {
  type        = string
  description = "Name of the NSG"
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

variable "subnet_ids" {
  type        = map(string)
  description = "Map of subnet names to subnet IDs"
}
