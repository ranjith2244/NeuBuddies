#RESOURCE GROUP for windows VMs
module "virtual_desktop_application_group" {
  source              = "../"
  appgroups_variables = var.appgroups_variables
}

