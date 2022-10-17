#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    flow_timeout_in_minutes     = number
    bgp_community               = string
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
    edge_zone                   = string
  }))
  default = {}
}

variable "subnet_variables" {
  type = map(object({
    name                                           = string
    resource_group_name                            = string
    virtual_network_name                           = string
    address_prefixes                               = list(string)
    enforce_private_link_service_network_policies  = bool
    enforce_private_link_endpoint_network_policies = bool
    service_endpoints                              = list(string)
    is_delegetion_required                         = bool
    delegation_name                                = string
    service_name                                   = string
    service_actions                                = list(string)
  }))
  default = {}
}



variable "network_security_group_variable" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    security_rule = list(object({
      name                                       = string
      description                                = string
      protocol                                   = string
      source_port_range                          = string
      source_port_ranges                         = list(string)
      destination_port_range                     = string
      destination_port_ranges                    = list(string)
      source_address_prefix                      = string
      source_address_prefixes                    = list(string)
      source_application_security_group_ids      = list(string)
      destination_address_prefix                 = string
      destination_address_prefixes               = list(string)
      destination_application_security_group_ids = list(string)
      access                                     = string
      priority                                   = string
      direction                                  = string
    }))
    network_security_group_tags = map(string)
  }))
}

variable "avd_host_pool_variables" {
  type = map(object({
    name                             = string
    resource_group_name              = string
    location                         = string
    friendly_name                    = string
    description                      = string
    custom_rdp_properties            = string
    host_pool_type                   = string
    personal_desktop_assignment_type = string
    load_balancer_type               = string
    maximum_sessions_allowed         = string
    preferred_app_group_type         = string
    validate_environment             = bool
    start_vm_on_connect              = bool
    host_pool_tags                   = map(string)
  }))
}

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

#windows VDI App Groups Variable
variable "appgroups_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    type                = string
    host_pool_name      = string
    host_pool_rg_name   = string
    friendly_name       = string
    description         = string
    appgroup_tags       = map(string)
  }))
}


variable "association_variables" {
  type = map(object({
    app_group = string
    workspace = string
  }))
}



variable "resource_group_name" {
  type = string
}
variable "vnet_name" {
}
variable "subnet_name" {
}

variable "rdsh_count" {
  description = "Number of AVD machines to deploy"
}

variable "prefix" {
  type        = string
  description = "Prefix of the name of the AVD machine(s)"
}

variable "vm_size" {
}

variable "local_admin_username" {
  type = string
}

variable "local_admin_password" {
  type = string
}
variable "source_image_reference" {
  type = map(string)
}
variable "os_disk_type" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "domain_user_upn" {
  type = string
}

variable "domain_password" {
  type = string
}

variable "host_pool_name" {
  type = string
}
variable "vnet_rg" {
  type        = string
  description = "Name of the Resource group in which to deploy session host"
}