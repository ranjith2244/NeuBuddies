#windows VDI Workspace Variable
variable "workspaces_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    friendly_name       = string
    description         = string
    workspace_tags      = map(string)
  }))
}