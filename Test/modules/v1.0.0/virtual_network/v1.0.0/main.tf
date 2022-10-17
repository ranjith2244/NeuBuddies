#Vnet
locals {
  is_ddos_protection_enabled = { for k, v in var.vnets_variables : k => v if lookup(v, "is_ddos_protection_required", false) == true }
}

# Fetch the data from ddos protection module when is_ddos_protection_enabled is set to true

data "azurerm_network_ddos_protection_plan" "ddos_protection_plan" {
  for_each            = local.is_ddos_protection_enabled
  name                = each.value.ddos_protection_plan_name
  resource_group_name = each.value.resource_group_name
}

#Vnet
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets_variables
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers == null ? null : each.value.dns_servers
  dynamic "ddos_protection_plan" {
    for_each = lookup(local.is_ddos_protection_enabled, each.key, false) == true ? [true] : []
    content {
      id     = data.azurerm_network_ddos_protection_plan.ddos_protection_plan[each.key].id
      enable = each.value.is_ddos_protection_required
    }
  }

  tags = merge(each.value.vnet_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}



