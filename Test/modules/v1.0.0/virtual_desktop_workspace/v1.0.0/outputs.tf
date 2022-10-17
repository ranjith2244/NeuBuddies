# output "workspace_id" {
#   value = {for k, v in azurerm_virtual_desktop_workspace.workspaces : k=>v.id}
#   description = "Created WorkSpace Information"
# }


output "workspace_output" {
  value       = azurerm_virtual_desktop_workspace.workspaces
  description = "Created WorkSpace Information"
}