resource "azurerm_subnet" "tfschool_firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.tfschool.name
  virtual_network_name = azurerm_virtual_network.tfschool_count[0].name
  address_prefixes     = [var.subnet_range_firewall]
}

resource "azurerm_public_ip" "tfschool" {
  name                = "ip-${local.workload_context}"
  location            = azurerm_resource_group.tfschool.location
  resource_group_name = azurerm_resource_group.tfschool.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.security_tags
}

resource "azurerm_firewall" "tfschool" {
  name                = "fw-${local.workload_context}"
  location            = azurerm_resource_group.tfschool.location
  resource_group_name = azurerm_resource_group.tfschool.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.tfschool_firewall.id
    public_ip_address_id = azurerm_public_ip.tfschool.id
  }

  tags = var.security_tags
}

resource "azurerm_firewall_application_rule_collection" "tfschool" {
  name                = "fwrc-${local.workload_context}"
  azure_firewall_name = azurerm_firewall.tfschool.name
  resource_group_name = azurerm_resource_group.tfschool.name
  priority            = 100
  action              = "Allow"

  dynamic "rule" {
    for_each = var.firewall_rules
    content {
      name             = rule.value.name
      source_addresses = rule.value.source_addresses
      target_fqdns     = rule.value.target_fqdns

      dynamic "protocol" {
        for_each = rule.value.protocols
        content {
          port = protocol.value.port
          type = protocol.value.type
        }
      }
    }
  }
}