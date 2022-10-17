
variable "resource_group_name" {
  type        = string
  description = "Name of the Resource group in which to deploy session host"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
}

variable "subnet_name" {
  description = "Name of the Subnet"
}

variable "rdsh_count" {
  description = "Number of AVD machines to deploy"
}

variable "prefix" {
  type        = string
  description = "Prefix of the name of the AVD machine(s)"
}

variable "vm_size" {
  description = "Size of the machine to deploy"
}

variable "local_admin_username" {
  type        = string
  description = "local admin username"
}

variable "local_admin_password" {
  type        = string
  description = "local admin password"
}
variable "source_image_reference" {
  type = map(string)
}
variable "os_disk_type" {
  type = string
}

variable "domain_name" {
    type = string
}

variable "domain_user_upn" {
  type =string
}

variable "domain_password" {
  type=string
}

variable "host_pool_name" {
  type=string
}



variable "vnet_rg" {
  type        = string
  description = "Name of the Resource group in which to deploy session host"
}

