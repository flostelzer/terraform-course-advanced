terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~>3.116.0"
      configuration_aliases = [azurerm.second_provider]
    }
  }
}

# Why using only one provider version per provider:
# https://support.hashicorp.com/hc/en-us/articles/28876701200403-Configuring-Terraform-to-use-multiple-versions-version-constraints-of-the-same-Terraform-Provider-in-a-single-module

provider "azapi" {
}

provider "azurerm" {
  subscription_id = var.provider_azurerm_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "second_provider"
  subscription_id = var.provider_azurerm_subscription_id
  features {}
}

# Naming module:
# https://registry.terraform.io/modules/Azure/naming/azurerm/latest
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.0"
  suffix  = [local.workload_context_workspaces_short]
}

resource "azurerm_resource_group" "tfschool" {
  name     = "rg-${local.workload_context_workspaces}"
  location = var.location

  tags = var.security_tags
}