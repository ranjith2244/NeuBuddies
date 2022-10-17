#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}

#DDOS protection plan variable. Uncomment if DDOS protection required
#   variable "ddos_protection_plan_variables" {
#     type = map(object({
#      name                            = string
#      resource_group_name             = string
#      location                        = string
#      enable_ddos_pp                  = bool 
#      ddos_protection_plan_tags       = map(string)
#   }))
#  }
  