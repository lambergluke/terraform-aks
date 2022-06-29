provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks-group" {
  name     = "aks-resources"
  location = "East US 2"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "example-aks1"
  location            = azurerm_resource_group.aks-group.location
  resource_group_name = azurerm_resource_group.aks-group.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_E2bs_v5"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "test1"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}