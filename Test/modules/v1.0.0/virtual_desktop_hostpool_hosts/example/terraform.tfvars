resource_group_name = "Bulk-deploy"
prefix = "arinatest25"
host_pool_name  = "testhostpool2"
source_image_reference = {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "20h2-evd"
    version   = "latest"
}

vm_size = "Standard_DS2_v2"
os_disk_type = "Standard_LRS" 

vnet_name = "AvdVnet"
subnet_name = "default"
rdsh_count = "2"

local_admin_username = "azureadmin"
local_admin_password = "P@$$w0rd1234!"


domain_name = "hexaleap.co.in"
domain_user_upn = "azureadmin@hexaleap.co.in"
domain_password ="Qwerty@123456"