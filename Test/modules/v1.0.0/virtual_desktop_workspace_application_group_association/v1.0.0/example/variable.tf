variable "association_variable" {
  type = map(object({
    app_group = string
    workspace = string
  }))
}