# Network Security Group Variables
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location (region) where resources will be created"
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

# Network Security Rule Variables
variable "security_rule_name" {
  description = "The name of the network security rule"
  type        = string
}

variable "security_rule_priority" {
  description = "This specifies the priority of the secirty rule. Must be a unique value for each rule ranging from 100 and 4096."
  type        = number
  validation {
    condition     = var.security_rule_priority >= 100 && var.security_rule_priority <= 4096
    error_message = "The security_rule_priotity must range between 100 and 4096."
  }
}

variable "security_rule_direction" {
  description = "The direction of the security rule. Possible values are 'Inbound' and 'Outbound'."
  type        = string
  validation {
    condition     = var.security_rule_direction == "Inbound" || var.security_rule_direction == "Outbound"
    error_message = "The security_rule_direction must be either 'Inbound' or 'Outbound'."
  }
}

variable "security_rule_access" {
  description = "The access type of the security rule. Possible values are 'Allow' and 'Deny'."
  type        = string
  validation {
    condition     = var.security_rule_access == "Allow" || var.security_rule_access == "Deny"
    error_message = "The security_rule_access must be either 'Allow' or 'Deny'."
  }
}

variable "security_rule_protocol" {
  description = "This network protocol of the security rule. Possible values include 'Tcp', 'Udp', 'Icmp', 'Esp', 'Ah' or '*'."
  type        = string
  validation {
    condition = (
      var.security_rule_protocol == "Tcp" ||
      var.security_rule_protocol == "Udp" ||
      var.security_rule_protocol == "Icmp" ||
      var.security_rule_protocol == "Esp" ||
      var.security_rule_protocol == "Ah" ||
      var.security_rule_protocol == "*"
    )
    error_message = "The security_rule_protocol must be one of the ff types only: 'Tcp', 'Udp', 'Icmp', 'Esp', 'Ah' or '*'."
  }
}

variable "source_port_range" {
  description = "Source port or range. Must range between 0 and 65535 or '*'."
  type        = string
  validation {
    condition = (
      var.source_port_range == "*" ||
      (can(tonumber(var.source_port_range)) && tonumber(var.source_port_range) >= 0 && tonumber(var.source_port_range) <= 65535)
    )
    error_message = "The source_port_range must be '*' or a number between 0 and 65535."
  }
}

variable "destination_port_range" {
  description = "Destination port or range. Must range between 0 and 65535 or '*'."
  type        = string
  validation {
    condition = (
      var.destination_port_range == "*" ||
      (can(tonumber(var.destination_port_range)) && tonumber(var.destination_port_range) >= 0 && tonumber(var.destination_port_range) <= 65535)
    )
    error_message = "The destination_port_range must be '*' or a number between 0 and 65535."
  }
}

variable "source_address_prefix" {
  description = "CIDR or source IP range or '*' to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used."
  type        = string
  validation {
    condition = (
      var.source_address_prefix == "*" ||
      var.source_address_prefix == "VirtualNetwork" ||
      var.source_address_prefix == "AzureLoadBalancer" ||
      var.source_address_prefix == "Internet" ||
      can(cidrhost(var.source_address_prefix, 0))
    )
    error_message = "The source_address_prefix must be a valid CIDR block, '*', or one of the Azure service tags (VirtualNetwork, AzureLoadBalancer, Internet)."
  }
}

variable "destination_address_prefix" {
  description = " CIDR or source IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used."
  type        = string
  validation {
    condition = (
      var.destination_address_prefix == "*" ||
      var.destination_address_prefix == "VirtualNetwork" ||
      var.destination_address_prefix == "AzureLoadBalancer" ||
      var.destination_address_prefix == "Internet" ||
      can(cidrhost(var.destination_address_prefix, 0))
    )
    error_message = "The destination_address_prefix must be a valid CIDR block, '*', or one of the Azure service tags (VirtualNetwork, AzureLoadBalancer, Internet)."
  }
}