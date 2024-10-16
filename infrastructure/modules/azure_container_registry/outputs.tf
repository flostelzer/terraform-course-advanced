output "acr_id" {
  description = "Defines the id of the Azure Container Registry."
  value       = azurerm_container_registry.tfschool.id
}

output "acr_login_server" {
  description = "Defines the login server for the Azure Container Registry"
  value       = azurerm_container_registry.tfschool.login_server
}

output "acr_admin_username" {
  description = "Defines the admin username of the Azure Container Registry, if used."
  value       = var.admin_enabled ? azurerm_container_registry.tfschool.admin_username : null
}
