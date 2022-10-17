envi = "Dev2"
resource_group_location = "eastus"
hostpool_type = "Pooled"
rdsh_count    = "1"

offer     = "Windows-10"
sku       = "20h2-evd"

vm_size              = "Standard_DS2_v2"
os_disk_type         = "Standard_LRS"

vnet_name            = "AvdVnet"
subnet_name          = "default"
vnet_rg              = "HostPool1"

local_admin_username = "testadmin22"
local_admin_password = "P@$$w0rd1234!"
domain_name          = "hexaleap.co.in"
domain_user_upn      = "azureadmin@hexaleap.co.in"
domain_password      = "Qwerty@12345678"
