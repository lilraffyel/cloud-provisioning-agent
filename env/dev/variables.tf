# Azure Provider Variables
# variable subscription_id {
#   description = "The subscription ID for the Azure provider"
#   type        = string
# }

# Resource Group Variables
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

# Virtual Network Variables
variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "A list of DNS server IP addresses"
  type        = list(string)
  default     = ["168.63.129.16"] # Default Azure DNS server
}

# Subnet Variables
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes to use for the subnet"
  type        = list(string)
}
