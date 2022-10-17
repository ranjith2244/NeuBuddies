output "nsg_ids" {
  value       = { for k, v in var.network_security_group_variable : k => azurerm_network_security_group.network_security_group[k].id }
  description = "NSG Id's"
}