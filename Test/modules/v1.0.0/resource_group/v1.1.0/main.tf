locals {
  tags = {
    environment = "${var.envi}-Environment"
  }
}
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.envi}-Resource-Group"
  location = var.resource_group_location
  tags     = merge(local.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

