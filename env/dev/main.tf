locals {
  common_tags = {
    Environment = "dev"
    Project     = "cloud-provisioning-agent"
    Owner       = "minari"
  }
}

module "resource_group" {
  source              = "../../modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.common_tags
}


module "virtual_network" {
  source                  = "../../modules/virtual_network"
  virtual_network_name    = var.virtual_network_name
  location                = var.location
  resource_group_name     = module.resource_group.name
  address_space           = var.address_space
  dns_servers             = var.dns_servers
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  tags                    = local.common_tags


  depends_on = [module.resource_group]
}

