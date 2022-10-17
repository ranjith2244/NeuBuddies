#windows VDI App Groups Variable
variable "association_variables" {
  type = map(object({
    app_group = string
    workspace = string
  }))
}
