module "azure_container_registry" {
  count = terraform.workspace == "prod" ? 1 : 0

  source = "git::ssh://git@github.com/flostelzer/terraform-course-advanced-child.git?ref=2.0.0"
  # source = "../../terraform-course-advanced-child"

  providers = {
    azurerm                 = azurerm
    azurerm.second_provider = azurerm.second_provider
  }

  resource_group_name = azurerm_resource_group.tfschool.name
  location            = azurerm_resource_group.tfschool.location

  azure_container_registry_name = "acr${local.workload_context_workspaces_short}"
  azure_container_registry_sku  = "Premium"
  azure_container_admin_enabled = false

  log_analytics_workspace_name              = "law-${local.workload_context_workspaces}-module"
  log_analytics_workspace_sku               = "PerGB2018"
  log_analytics_workspace_retention_in_days = 30

  tags = var.security_tags
}


# Azure Verified Modules:
# https://registry.terraform.io/modules/Azure/avm-res-containerregistry-registry/azurerm/latest
# module "avm-res-containerregistry-registry" {
#   count = terraform.workspace == "dev" ? 1 : 0

#   source  = "Azure/avm-res-containerregistry-registry/azurerm"
#   version = "0.3.1"

#   name                = "${module.naming.container_registry.name}avm"
#   resource_group_name = azurerm_resource_group.tfschool.name
#   location            = azurerm_resource_group.tfschool.location

#   tags = var.security_tags
# }