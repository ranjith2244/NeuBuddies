#Vnet id
output "vnet_id" {
  value = { for k, v in azurerm_virtual_network.vnet : k => v.id }
}

#Vnet address space 
output "vnet_address_space" {
  value = { for k, v in azurerm_virtual_network.vnet : k => v.address_space }
}

