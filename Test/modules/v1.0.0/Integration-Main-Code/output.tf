output "resourcegroup-id" {
    value = module.resource_group.resource_group_id 
}
output "resourcegroup-name" {
    value = module.resource_group.resource_group_name 
}
output "hostpool-name" {
    value = module.virtual_desktop_host_pool.virtual_desktop_host_pool_name
}
output "hostpoolid" {
    value = module.virtual_desktop_host_pool.virtual_desktop_host_pool_id
}
output "app_group_name" {
  value = module.virtual_desktop_application_group.virtual_desktop_app_group_name
}
output "app_group_id" {
  value = module.virtual_desktop_application_group.virtual_desktop_app_group_id
}
output "workspace_name" {
  value = module.virtual_desktop_workspace.workspace_name
}
output "workspace_id" {
  value = module.virtual_desktop_workspace.workspace_id
}
