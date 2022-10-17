# #RESOURCE GROUP
resource_group_variables = {
  "resource_group_1" = {
    name     = "arina-test-rg"
    location = "East US"
    resource_group_tags = {
      Created_By = "ranjith.prasanna@arina.co.in",
      #  Department = "CIS"
    }
  }
}


#VNET 
vnets_variables = {
  "vnet_1" = {
    name                        = "ploceusvnet000001a"
    location                    = "East US"
    resource_group_name         = "arina-test-rg"
    address_space               = ["10.0.0.0/16"]
    dns_servers                 = []
    flow_timeout_in_minutes     = null #possible values are between 4 and 30 minutes.
    bgp_community               = null
    edge_zone                   = null
    is_ddos_protection_required = false #Provide the value as true only if ddos_protection_plan is required
    ddos_protection_plan_name   = null  #Provide the name of the ddos protection plan if above value is true or else keep it as null. If new DDOS protection plan needs to be created uncomment from line 24 to 34
    vnet_tags = {
      Created_By = "rashmi.pandey@arina.co.in",
      # Department = "CIS"
    }
  }
}


subnet_variables = {
  "subnet_1" = {
    name                                           = "arinasubnet000001a"
    resource_group_name                            = "arina-test-rg"
    address_prefixes                               = ["10.0.1.0/27"]
    virtual_network_name                           = "ploceusvnet000001a"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]
    delegation_name                                = "delegation000001"
    service_name                                   = "Microsoft.Sql/managedInstances"
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  }
}

network_security_group_variable = {
  #NSG with none security rules
  "network_security_group_1" = {
    name                = "arinansg000001"
    resource_group_name = "arina-test-rg"
    location            = "East US"
    security_rule       = null
    network_security_group_tags = {
      Created_By = "rashmi.pandey@arina.co.in",
      # Department = "arina"
    }
  }
}

avd_host_pool_variables = {
  "host_pool1" = {
    name                  = "arinatesthostpool1"
    location              = "East US"
    resource_group_name   = "arina-test-rg"
    friendly_name         = "arinatesthostpool1"
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
      Created_By = "deboparna.goldar@arina.co.in",
      # Department = "CT"
    }
  }
}


#AppGroup
appgroups_variables = {
  "key" = {
    appgroup_tags = {
      Created_By = "",
      # Department = "CIS"
    }
    description         = "Description of App Group"
    friendly_name       = "Arina App Group"
    host_pool_name      = "arinatesthostpool1"
    host_pool_rg_name   = "arina-test-rg"
    location            = "East US"
    name                = "arinaappGroup"
    resource_group_name = "arina-test-rg"
    type                = "RemoteApp"
  }
}


workspaces_variables = {
  "workspace" = {
    name                = "arinavdiworkspace000001"
    location            = "East US"
    resource_group_name = "arina-test-rg"
    friendly_name       = "arinavdi"
    description         = "VDI for arinaUser"
    workspace_tags = {
      CreatedBy = "deboparna.goldar@arina.co.in"
    }
  }
}

#Work space and Application Group allocation variables
association_variables = {
  key1 = {
    app_group = "arinaappGroup"
    workspace = "arinavdiworkspace000001"
  }
}


resource_group_name = "arina-test-rg"
prefix              = "arinatest2687"
host_pool_name      = "arinatesthostpool1"
source_image_reference = {
  publisher = "MicrosoftWindowsDesktop"
  offer     = "Windows-10"
  sku       = "20h2-evd"
  version   = "latest"
}
vm_size              = "Standard_DS2_v2"
os_disk_type         = "Standard_LRS"
vnet_name            = "AvdVnet"
subnet_name          = "default"
vnet_rg              = "HostPool1"
rdsh_count           = "1"
local_admin_username = "azureadmin"
local_admin_password = "P@$$w0rd1234!"
domain_name          = "hexaleap.co.in"
domain_user_upn      = "azureadmin@hexaleap.co.in"
domain_password      = "Qwerty@123456"