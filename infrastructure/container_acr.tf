module "acr" {
  count = terraform.workspace == "dev" ? 1:0
  
  source              = "./modules/azure_container_registry"
  acr_name            = "acr${local.workload_context_short}"
  resource_group_name = azurerm_resource_group.tfschool.name
  location            = azurerm_resource_group.tfschool.location
  sku                 = "Premium"
  admin_enabled       = false

  tags = var.security_tags
}


# Azure Verified Modules:
# https://registry.terraform.io/modules/Azure/avm-res-containerregistry-registry/azurerm/latest
module "avm-res-containerregistry-registry" {
  count = terraform.workspace == "dev" ? 1:0
  
  source  = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "0.3.1"

  name                = "${module.naming.container_registry.name}avm"
  resource_group_name = azurerm_resource_group.tfschool.name
  location            = azurerm_resource_group.tfschool.location

  tags = var.security_tags
}