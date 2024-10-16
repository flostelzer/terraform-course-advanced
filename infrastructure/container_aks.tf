resource "azapi_resource" "tfschool_aks_automatic_cluster" {
  type      = "Microsoft.ContainerService/managedClusters@2024-03-02-preview"
  parent_id = azurerm_resource_group.tfschool.id
  name      = "aks-${local.workload_context}"
  location  = azurerm_resource_group.tfschool.location

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      kubernetesVersion = "1.30.4"
      #dnsPrefix         = "tfschooling"
      agentPoolProfiles = [
        {
          name   = "agentpool"
          count  = 3
          vmSize = "Standard_DS4_v2"
          osType = "Linux"
          mode   = "System"
        }
      ]
    }
    sku = {
      name = "Automatic"
      tier = "Standard"
    }
  }
  tags = azurerm_resource_group.tfschool.tags
}

resource "azurerm_role_assignment" "current_user_to_rbac_cluster_admin" {
  scope                = azapi_resource.tfschool_aks_automatic_cluster.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = data.azurerm_client_config.current_user.object_id
}