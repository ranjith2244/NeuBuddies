#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}


#VNET
module "vnet" {
  source          = "../"
  vnets_variables = var.vnets_variables
  # depends_on = [module.ddos_protection_plan]
}


#DDOS protection plan. Uncomment to create DDos protection plan
# module "ddos_protection_plan" {
#   source                    = "../../../ddos_protection_plan/v1.0.0"
#   ddos_protection_plan_variables = var.ddos_protection_plan_variables
# }










