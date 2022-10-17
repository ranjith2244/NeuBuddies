# azure virtual desktop workspace
data "azurerm_resources" "host_pool" {
  type     = "Microsoft.DesktopVirtualization/hostpools"
  for_each = var.appgroups_variables
  name     = each.value.host_pool_name
  resource_group_name = each.value.host_pool_rg_name
}


resource "azurerm_virtual_desktop_application_group" "app_groups" {
  for_each = var.appgroups_variables

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  type          = each.value.type
  host_pool_id  = replace(data.azurerm_resources.host_pool[each.key].resources[0].id, "/hostpools", "/hostPools")
  friendly_name = each.value.friendly_name
  description   = each.value.description

  tags = merge(each.value.appgroup_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
  depends_on = [
    data.azurerm_resources.host_pool
  ]
}
