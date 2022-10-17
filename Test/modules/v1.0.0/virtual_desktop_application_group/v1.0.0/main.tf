
locals {
  tags = {
    environment = "${var.envi}-Environment"
  }
  resource_group_name = "${var.envi}-Resource-Group"
  host_pool_name = "${var.envi}-Host-Pool"
}
data "azurerm_resources" "host_pool" {
  type     = "Microsoft.DesktopVirtualization/hostpools"
  name     = local.host_pool_name
  resource_group_name = local.resource_group_name
}


resource "azurerm_virtual_desktop_application_group" "app_groups" {
  name                = "${var.envi}-Application-Group"
  location                   = var.resource_group_location
  resource_group_name        = local.resource_group_name

  type          = "RemoteApp"
  host_pool_id  = replace(data.azurerm_resources.host_pool.resources[0].id, "/hostpools", "/hostPools")
  friendly_name = "${var.envi}-Application-Group"
  description   = "This is the ${var.envi}-Application-Group"

 tags     = merge(local.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
  depends_on = [
    data.azurerm_resources.host_pool
  ]
}
