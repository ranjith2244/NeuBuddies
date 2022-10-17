#RESOURCE GROUP
#module "resource_group" {
#source                   = "../../../resource_group/v1.0.0"
#resource_group_variables = var.resource_group_variables


#Network Security Group
module "network_security_group" {
  source                          = "../"
  network_security_group_variable = var.network_security_group_variable
  #depends_on                      = [module.resource_group]
}