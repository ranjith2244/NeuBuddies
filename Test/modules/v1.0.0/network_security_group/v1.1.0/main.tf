resource "azurerm_network_security_group" "network_security_group" {
  for_each            = var.network_security_group_variable
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  security_rule       = each.value.security_rule == null ? [] : each.value.security_rule
  tags                = merge(each.value.network_security_group_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}