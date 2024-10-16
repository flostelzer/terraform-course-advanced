resource "azurerm_virtual_network" "tfschool_count" {
  count = length(var.subnets) != 0 ? 1 : 0

  name                = "vnet-${local.workload_context}"
  resource_group_name = azurerm_resource_group.tfschool.name
  location            = azurerm_resource_group.tfschool.location
  address_space       = [var.vnet_range]

  tags = var.security_tags
}

resource "azurerm_subnet" "tfschool_for_each_case_1" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                 = "snet-${local.workload_context}-${each.value.name}"
  resource_group_name  = azurerm_resource_group.tfschool.name
  virtual_network_name = azurerm_virtual_network.tfschool_count[0].name
  address_prefixes     = [each.value.address_prefix]
}

