resource "azurerm_network_security_group" "main" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "main" {
  name                        = var.security_rule_name
  priority                    = var.security_rule_priority
  direction                   = var.security_rule_direction
  access                      = var.security_rule_access
  protocol                    = var.security_rule_protocol
  source_port_range           = var.source_port_range
  destination_port_range      = var.destination_port_range
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = azurerm_network_security_group.main.resource_group_name
  network_security_group_name = azurerm_network_security_group.main.name
}