locals {
  tags = {
    environment = "${var.envi}-Environment"
  }
  resource_group_name = "${var.envi}-Resource-Group"
}

resource "azurerm_virtual_desktop_host_pool" "virtual_desktop_host_pool" {
 
  location                         = var.resource_group_location
  resource_group_name              = local.resource_group_name
  name                             = "${var.envi}-Host-Pool"
  friendly_name                    = "${var.envi}-Host-Pool"
  validate_environment             = true
  start_vm_on_connect              = true
  custom_rdp_properties            = null
  description                      = "this is the ${var.envi}-Environmnet hostPool"
  type                             = var.hostpool_type
  load_balancer_type               = "BreadthFirst"
  preferred_app_group_type         = "Desktop"
  tags     = merge(local.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

