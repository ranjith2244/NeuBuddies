#RESOURCE GROUP
# module "resource_group" {
#  source                   = "../../../resource_group/v1.0.0"
#   resource_group_variables = var.resource_group_variables
# }

# VIRTUAL DESKTOP HOST POOL
module "virtual_desktop_host_pool" {
  source                  = "../"
  avd_host_pool_variables = var.avd_host_pool_variables
  
}