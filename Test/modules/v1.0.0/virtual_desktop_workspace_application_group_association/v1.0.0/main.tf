locals {
  tags = {
    environment = "${var.envi}-Environment"
  }
  resource_group_name = "${var.envi}-Resource-Group"
  application_group_name = "${var.envi}-Application-Group"
  workspace_name = "${var.envi}-Work-Space"
}
data "azurerm_resources" "appgroup" {
  type     = "Microsoft.DesktopVirtualization/applicationGroups"
  name     = local.application_group_name
  resource_group_name = local.resource_group_name
}
data "azurerm_resources" "workspace" {
  type     = "Microsoft.DesktopVirtualization/workspaces"
  name     = local.workspace_name
  resource_group_name = local.resource_group_name
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "association" {
 #workspace_id         =  data.azurerm_resources.workspace.resources[0].id
  #data.azurerm_resources.workspace.resources[0].id
  workspace_id = data.azurerm_resources.workspace.resources[0].id
  application_group_id = replace(data.azurerm_resources.appgroup.resources[0].id,"/applicationgroups","/applicationGroups")
  depends_on = [
    data.azurerm_resources.workspace
  ]
}


