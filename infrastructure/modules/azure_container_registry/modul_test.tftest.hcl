provider "azurerm" {
  features {}
}

variables {
  acr_name            = "acrtfstestchn1"
  resource_group_name = "rg-tfschool-dev-chn-1"
  location            = "switzerlandnorth"
  sku                 = "Standard"
  admin_enabled       = true

  tags = {
    SecfixOwner            = "florian.stelzer@ipt.ch"
    SecfixNonProd          = "true"
    SecfixNoAlert          = "true"
    SecfixContainsUserData = "false"
    SecfixContainsEPHI     = "false"
    SecfixDescription      = "non-productive and non-sensitive workloads"
    expireOn               = "2024-10-30"
  }
}

run "basic_acr_test" {
  command = apply

  assert {
    condition     = length(azurerm_container_registry.tfschool.id) > 0
    error_message = "No Id for Azure Container Registry."
  }
  #   assert {
  #     condition     = can(regex("^[a-zA-Z0-9]+$", azurerm_container_registry.tfschool.id))
  #     error_message = " ACR name must be alphanumeric."
  #   }

}
