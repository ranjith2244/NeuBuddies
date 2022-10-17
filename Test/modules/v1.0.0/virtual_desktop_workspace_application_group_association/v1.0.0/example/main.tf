#RESOURCE GROUP for windows VMs
module "virtual_desktop_workspace_application_group_association" {
  source              = "../"
  association_variable = var.association_variable
}

