#Vnet id
output "vnet_id" {
  value = module.vnet.vnet_id
}
#Vnet address space
output "vnet_adress_spaces" {
  value = module.vnet.vnet_address_space
}

