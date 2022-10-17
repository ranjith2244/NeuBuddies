variable "resource_group_location" {
  type = string
}

variable "envi" {
  type = string
}


variable "vnet_name" {
  type = string
}
variable "subnet_name" {
  type = string
}
variable "rdsh_count" {
  type =  number
}
variable "vm_size" {
  type = string
}
variable "local_admin_username" {
  type = string
}
variable "local_admin_password" {
  type = string
}
variable "offer" {
  type = string
}
variable "sku" {
  type = string
}
variable "os_disk_type" {
  type = string
}
variable "domain_name" {
  type = string
}
variable "domain_user_upn" {
  type = string
}
variable "domain_password" {
  type = string
}

variable "vnet_rg" {
  type        = string
  description = "Name of the Resource group in which to deploy session host"
}
