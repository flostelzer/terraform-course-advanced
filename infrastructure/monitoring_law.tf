resource "azurerm_log_analytics_workspace" "tfschool" {
  provider = azurerm.second_provider
  count    = length(azurerm_resource_group.tfschool.name) != 0 ? 1 : 0

  name                = "law-${local.workload_context}"
  location            = azurerm_resource_group.tfschool.location
  resource_group_name = azurerm_resource_group.tfschool.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = azurerm_resource_group.tfschool.tags

  depends_on = [
    azurerm_network_security_group.tfschool
  ]

  lifecycle {
    ignore_changes = [
      retention_in_days
    ]
  }
}