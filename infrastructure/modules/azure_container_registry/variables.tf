variable "acr_name" {
  description = "Defines the name of the Azure Container Registry."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9]+$", var.acr_name))
    error_message = "Value must be alphanumeric."
  }
  sensitive = false
  nullable  = false
}

variable "resource_group_name" {
  description = "Defines the resource group name for the Azure Container Registry."
  type        = string
}

variable "location" {
  description = "Defines the location, where the Azure Container Registry is deployed."
  type        = string
}

variable "sku" {
  description = "Defines the SKU-Level of the Azure Container Registry (Basic, Standard, Premium)."
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Defines if admin is enabled on the Azure Container Registry."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Defines the used tags for the Azure Container Registry."
  type        = map(string)
  default     = {}
}
