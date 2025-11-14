output "vnet_id" {
  description = "Virtual network id"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "List of subnet ids"
  value       = azurerm_subnet.main.id
}