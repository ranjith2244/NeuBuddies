#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  #depends_on = [module.ddos_protection_plan]  #Uncomment if the ddos protection plan is required
}

#DDOS protection plan
#module "ddos_protection_plan" {
#  source                    = "../../../ddos_protection_plan/v1.0.0"
#  ddos_protection_plan_variables = var.ddos_protection_plan_variables
#}

#SUBNET
module "subnet" {
  source           = "../"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

