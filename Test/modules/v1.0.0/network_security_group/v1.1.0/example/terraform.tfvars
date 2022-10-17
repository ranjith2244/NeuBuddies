#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "arina-sandbox-rg"
    location = "East US 2"
    resource_group_tags = {
      Created_By = "adithya",
      Department = "arina"
    }
  }
}

#NSG
network_security_group_variable = {
  #NSG with none security rules
  "network_security_group_1" = {
    name                = "arinansg000001"
    resource_group_name = "arina-sandbox-rg"
    location            = "East US 2"
    security_rule       = null
    network_security_group_tags = {
      Created_By = "adithya",
      Department = "arina"
    }
  },
  #NSG with one security rule 
  "network_security_group_2" = {
    name                = "arinansg000002"
    resource_group_name = "arina-sandbox-rg"
    location            = "East US 2"
    security_rule = [
      {
        name                                       = "arinansg000002"
        priority                                   = 100
        direction                                  = "Inbound"
        access                                     = "Allow"
        protocol                                   = "Tcp"
        source_port_range                          = "*"
        source_port_ranges                         = null
        destination_port_range                     = "*"
        destination_port_ranges                    = null
        source_address_prefix                      = "*"
        source_address_prefixes                    = null
        destination_address_prefix                 = "*"
        destination_address_prefixes               = null
        description                                = "InboudAllow100"
        source_application_security_group_ids      = null
        destination_application_security_group_ids = null
      }
    ]
    network_security_group_tags = {
      Created_By = "adithya",
      Department = "arina"
    }
  },
  #NSG with multiple security rules
  "network_security_group_3" = {
    name                = "arinansg000003"
    resource_group_name = "arina-sandbox-rg"
    location            = "East US 2"
    security_rule = [
      {
        name                                       = "arinansg000003"
        priority                                   = 100
        direction                                  = "Inbound"
        access                                     = "Allow"
        protocol                                   = "Tcp"
        source_port_range                          = "*"
        source_port_ranges                         = null
        destination_port_range                     = "*"
        destination_port_ranges                    = null
        source_address_prefix                      = "*"
        source_address_prefixes                    = null
        destination_address_prefix                 = "*"
        destination_address_prefixes               = null
        description                                = "InboudAllow100"
        source_application_security_group_ids      = null
        destination_application_security_group_ids = null
      },
      {
        name                                       = "arinansg0000031"
        priority                                   = 100
        direction                                  = "Outbound"
        access                                     = "Allow"
        protocol                                   = "Tcp"
        source_port_range                          = "*"
        source_port_ranges                         = null
        destination_port_range                     = "*"
        destination_port_ranges                    = null
        source_address_prefix                      = "*"
        source_address_prefixes                    = null
        destination_address_prefix                 = "*"
        destination_address_prefixes               = null
        description                                = "OutboudAllow100"
        source_application_security_group_ids      = null
        destination_application_security_group_ids = null
      }
    ]
    network_security_group_tags = {
      Created_By = "adithya",
      Department = "arina"
    }
  }
}