
module "resource_group" {
  source                   = "../resource_group/v1.1.0"
  envi = var.envi
  resource_group_location = var.resource_group_location
}

/*

#Virtual Network
module "virtual_network" {
  source              = "../virtual_network/v1.1.0"  
 vnets_variables = var.vnets_variables
  depends_on          = [module.resource_group]
}

#Subnet
module "subnet" {
  source                  = "../subnet/v1.1.0" 
  subnet_variables = var.subnet_variables
  depends_on              = [module.virtual_network]
}
*/
module "virtual_desktop_host_pool" {
  source                  = "../virtual_desktop_hostpool/v1.0.0"
  envi = var.envi
  resource_group_location = var.resource_group_location
  hostpool_type = var.hostpool_type
  depends_on              = [module.resource_group]
}

module "virtual_desktop_application_group" {
  source              = "../virtual_desktop_application_group/v1.0.0"
  envi = var.envi
  resource_group_location = var.resource_group_location
  depends_on          = [module.virtual_desktop_host_pool]
}

module "virtual_desktop_workspace" {
  source               = "../virtual_desktop_workspace/v1.0.0"
  envi = var.envi
  resource_group_location = var.resource_group_location
  depends_on           = [module.resource_group,module.virtual_desktop_application_group]
}

module "virtual_desktop_workspace_application_group_association" {
  source                = "../virtual_desktop_workspace_application_group_association/v1.0.0"
  envi = var.envi
  resource_group_location = var.resource_group_location
  depends_on            = [module.virtual_desktop_workspace, module.virtual_desktop_application_group]
}



#################################################################################################


module "virtual_desktop_hostpool_hosts" {
  source                 = "../virtual_desktop_hostpool_hosts"
  envi = var.envi
  resource_group_location = var.resource_group_location
  offer  = var.offer
  sku = var.sku
  vm_size                = var.vm_size
  os_disk_type           = var.os_disk_type
  vnet_name              = var.vnet_name
  subnet_name            = var.subnet_name
  rdsh_count             = var.rdsh_count
  local_admin_username   = var.local_admin_username
  local_admin_password   = var.local_admin_password
  domain_name            = var.domain_name
  domain_user_upn        = var.domain_user_upn
  domain_password        = var.domain_password
  vnet_rg                = var.vnet_rg
  depends_on = [
    module.resource_group, module.virtual_desktop_host_pool, module.virtual_desktop_workspace_application_group_association
  ]
}
