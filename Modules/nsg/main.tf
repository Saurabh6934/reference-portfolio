resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  for_each = var.subnet_ids

  subnet_id                 = each.value
  network_security_group_id = azurerm_network_security_group.nsg.id
}
