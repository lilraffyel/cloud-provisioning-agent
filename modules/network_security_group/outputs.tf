output "name" {
  description = "Network security group name"
  value       = azurerm_network_security_group.main.name
}

output "id" {
  description = "Network security group id"
  value       = azurerm_network_security_group.main.id
}

output "resource_group_name" {
  description = "Resource group name that the NSG belongs to"
  value       = azurerm_network_security_group.main.resource_group_name
}
