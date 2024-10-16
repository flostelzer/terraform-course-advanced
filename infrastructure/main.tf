terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~>4.5.0"
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

locals {
  workload_context       = "${var.workload_name}-${var.env}-${var.location_short}-${var.workload_instance}"
  workload_context_short = "${var.workload_name_short}${var.location_short}${var.workload_instance}"
}

resource "azurerm_resource_group" "tfschool" {
  name     = "rg-${local.workload_context}"
  location = var.location

  tags = var.security_tags
}