#Subnet
resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnet_variables
  resource_group_name                            = each.value.resource_group_name
  name                                           = each.value.name
  virtual_network_name                           = each.value.virtual_network_name
  address_prefixes                               = each.value.address_prefixes
  enforce_private_link_service_network_policies  = each.value.enforce_private_link_service_network_policies
  enforce_private_link_endpoint_network_policies = each.value.enforce_private_link_endpoint_network_policies
  service_endpoints                              = each.value.service_endpoints

  #Subnet delegation
  dynamic "delegation" {
    for_each = { for k, v in var.subnet_variables : k => v if lookup(v, "is_delegetion_required", false) == true }
    content {
      name = each.value.delegation_name
      service_delegation {
        name    = each.value.service_name
        actions = each.value.service_actions
      }
    }
  }
  timeouts {
  create = "60m"
  update = "50m"
  read   = "30m"
  delete = "2h"
  }
}