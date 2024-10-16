resource "azurerm_network_security_group" "tfschool" {
  name                = "nsg-${local.workload_context}"
  location            = var.location
  resource_group_name = azurerm_resource_group.tfschool.name

  tags = azurerm_resource_group.tfschool.tags
}

resource "azurerm_subnet_network_security_group_association" "tfschool_for_each_case_2" {
  for_each = { for subnet in var.subnets : subnet.name => subnet if strcontains(subnet.name, "b") }

  subnet_id                 = azurerm_subnet.tfschool_for_each_case_1[each.key].id
  network_security_group_id = azurerm_network_security_group.tfschool.id
}
