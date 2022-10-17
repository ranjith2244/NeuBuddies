locals {
  host_pool_pooled   = { for k, v in var.avd_host_pool_variables : k => v if lookup(v, "host_pool_type", "Pooled") == "Pooled" }
  host_pool_personal = { for k, v in var.avd_host_pool_variables : k => v if lookup(v, "host_pool_type", "Personal") == "Personal" }
}

resource "azurerm_virtual_desktop_host_pool" "virtual_desktop_host_pool_personal" {
  for_each                         = local.host_pool_personal
  location                         = each.value.location
  resource_group_name              = each.value.resource_group_name
  name                             = each.value.name
  friendly_name                    = each.value.friendly_name
  validate_environment             = each.value.validate_environment
  start_vm_on_connect              = each.value.start_vm_on_connect
  custom_rdp_properties            = each.value.custom_rdp_properties
  description                      = each.value.description
  type                             = each.value.host_pool_type
  personal_desktop_assignment_type = each.value.personal_desktop_assignment_type
  load_balancer_type               = each.value.load_balancer_type
  preferred_app_group_type         = each.value.preferred_app_group_type
  tags                             = merge(each.value.host_pool_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

resource "azurerm_virtual_desktop_host_pool" "virtual_desktop_host_pool_pooled" {
  for_each                 = local.host_pool_pooled
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  name                     = each.value.name
  friendly_name            = each.value.friendly_name
  validate_environment     = each.value.validate_environment
  start_vm_on_connect      = each.value.start_vm_on_connect
  custom_rdp_properties    = each.value.custom_rdp_properties
  description              = each.value.description
  type                     = each.value.host_pool_type
  maximum_sessions_allowed = each.value.maximum_sessions_allowed
  load_balancer_type       = each.value.load_balancer_type
  preferred_app_group_type = each.value.preferred_app_group_type
  tags                     = merge(each.value.host_pool_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
lifecycle { ignore_changes = [tags["Created_Time"]] }
}

