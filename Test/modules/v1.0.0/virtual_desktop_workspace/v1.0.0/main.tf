
data "azurerm_resource_group" "resource_group" {
  for_each = var.workspaces_variables
  name     = each.value.resource_group_name
}

# azure virtual desktop workspace
resource "azurerm_virtual_desktop_workspace" "workspaces" {
  for_each = var.workspaces_variables

  name                = each.value.name
  location            = each.value.location
  resource_group_name = data.azurerm_resource_group.resource_group[each.key].name

  friendly_name = each.value.friendly_name
  description   = each.value.description
  tags          = merge(each.value.workspace_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
  depends_on = [
    data.azurerm_resource_group.resource_group
  ]
}


