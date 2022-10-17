module "Host_pool_hosts_creation" {
    source = "../"
   resource_group_name = var.resource_group_name
    prefix = var.prefix
    host_pool_name  = var.host_pool_name
    source_image_reference = var.source_image_reference
 
vm_size = var.vm_size
os_disk_type =  var.os_disk_type

vnet_name = var.vnet_name
subnet_name = var.subnet_name
rdsh_count = var.rdsh_count

local_admin_username = var.local_admin_username
local_admin_password = var.local_admin_password


domain_name = var.domain_name
domain_user_upn = var.domain_name
domain_password = var.domain_password
}