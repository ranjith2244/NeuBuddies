# azure virtual desktop workspace

data "azurerm_resources" "appgroup" {
  type     = "Microsoft.DesktopVirtualization/applicationGroups"
  for_each = var.association_variables
  name     = each.value.app_group
}

data "azurerm_resources" "workspace" {
  type     = "Microsoft.DesktopVirtualization/workspaces"
  for_each = var.association_variables
  name     = each.value.workspace
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "association" {
  for_each = var.association_variables
  workspace_id         = data.azurerm_resources.workspace[each.key].resources[0].id
  application_group_id = replace(data.azurerm_resources.appgroup[each.key].resources[0].id,"/applicationgroups","/applicationGroups")
}