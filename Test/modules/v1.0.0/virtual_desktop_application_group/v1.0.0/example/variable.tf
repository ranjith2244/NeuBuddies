#windows VDI App Groups Variable
variable "appgroups_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    type                = string
    host_pool_name      = string
    friendly_name       = string
    description         = string
    appgroup_tags       = map(string)
  }))
  default = {}
}
