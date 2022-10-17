resource "azurerm_resource_group" "resource_group" {
  for_each = var.resource_group_variables
  name     = each.value.name
  location = each.value.location
  tags     = merge(each.value.resource_group_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

