#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "arinarg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "deboparna",
      Department = "CT"
    }
  }
}


#HOSTPOOL
avd_host_pool_variables = {
  "host_pool1" = {
    name                             = "arinatesthostpool1"
    location                         = "westus2"
    resource_group_name              = "arinarg000001"
    friendly_name                    = "arinatesthostpool1"
    description                      = "hostPoolDescription"
    custom_rdp_properties            = null
    host_pool_type                   = "Personal"
    personal_desktop_assignment_type = "Automatic"
    load_balancer_type               = "Persistent"
    preferred_app_group_type         = "Desktop" # can be Desktop, RailApplications
    # if host_pool_type is personal pass maximum_sessions_allowed = null
    maximum_sessions_allowed = null
    validate_environment     = true
    start_vm_on_connect      = true
    host_pool_tags = {
      Created_By = "deboparna",
      Department = "CT"
    }
  },
  "host_pool2" = {
    name                  = "arinatesthostpool2"
    location              = "westus2"
    resource_group_name   = "arinarg000001"
    friendly_name         = "arinatesthostpool2"
    description           = "hostPoolDescription"
    custom_rdp_properties = null
    host_pool_type        = "Pooled"
    # if host_pool_type is pooled make personal_desktop_assignment_type = null
    personal_desktop_assignment_type = null
    load_balancer_type               = "BreadthFirst"
    preferred_app_group_type         = "Desktop" # can be Desktop, RailApplications
    # if host_pool_type is personal make maximum_sessions_allowed = 0
    maximum_sessions_allowed = 3
    validate_environment     = true
    start_vm_on_connect      = true
    host_pool_tags = {
      Created_By = "deboparna",
      Department = "CT"
    }
  },
  "host_pool3" = {
    name                  = "arinatesthostpool3"
    location              = "westus2"
    resource_group_name   = "arinarg000001"
    friendly_name         = "arinatesthostpool3"
    description           = "hostPoolDescription"
    custom_rdp_properties = null
    host_pool_type        = "Pooled"
    # if host_pool_type is pooled make personal_desktop_assignment_type = null
    personal_desktop_assignment_type = null
    load_balancer_type               = "BreadthFirst"
    preferred_app_group_type         = "Desktop" # can be Desktop, RailApplications
    # if host_pool_type is personal make maximum_sessions_allowed = 0
    maximum_sessions_allowed = 3
    validate_environment     = true
    start_vm_on_connect      = true
    host_pool_tags = {
      Created_By = "deboparna",
      Department = "CT"
    }
  }

}


 
