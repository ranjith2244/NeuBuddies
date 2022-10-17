locals {
  tags = {
    environment = "${var.envi}-Environment"
  }
  resource_group_name = "${var.envi}-Resource-Group"
  host_pool_name = "${var.envi}-Host-Pool"
}


# azure virtual desktop workspace
resource "azurerm_virtual_desktop_workspace" "workspaces" {
  name                = "${var.envi}-Work-Space"
  location                   = var.resource_group_location
  resource_group_name        = local.resource_group_name

  friendly_name = "${var.envi}-Work-Space"
  description   = "This is a ${var.envi}-Environment Work-Space"
  tags     = merge(local.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}


