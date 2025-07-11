<<<<<<< Updated upstream

=======
import {
id = /subscriptions/ae58dd56-b863-47df-8495-c7b6ca0af926/resourceGroups/test-rg
to = azurerm_resource_group.aksrg

import {
id = /subscriptions/ae58dd56-b863-47df-8495-c7b6ca0af926/resourceGroups/test-rg/providers/Microsoft.Network/virtualNetworks/aks-terraform
to = azurerm_virtual_network.aksvnet

import {
id = /subscriptions/ae58dd56-b863-47df-8495-c7b6ca0af926/resourceGroups/test-rg/providers/Microsoft.Network/virtualNetworks/aks-terraform/subnets/aks-terraform-subnet-1
to = azurerm_subnet.akssubnet

data "azurerm_subnet" "akssubnet" {
  name                = "aks-terraform-subnet-1"
  virtual_network_name = "aks-terraform"
  resource_group_name  = "test-rg"
}

data "azurerm_virtual_network" "aksvnet" {
  name                = "aks-terraform"
  resource_group_name = "test-rg"
}

resource "azurerm_resource_group" "aksrg" {
  name     = "test-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "aks-terraform"
  resource_group_name = "test-rg"
  location            = "East US"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "aks-terraform-subnet-1"
  resource_group_name  = "test-rg"
  virtual_network_name = "aks-terraform"
  address_prefixes     = ["10.0.1.0/24"]
}

variable "location" {
  type = string
  description = "The Azure region to deploy resources into"
  default = "East US"
}

import {
id = /subscriptions/ae58dd56-b863-47df-8495-c7b6ca0af926/resourceGroups/test-rg
to = azurerm_resource_group.resource_group_name
}

import {
id = /subscriptions/ae58dd56-b863-47df-8495-c7b6ca0af926/resourceGroups/test-rg/providers/Microsoft.Network/virtualNetworks/aks-terraform
to = azurerm_virtual_network.vnet_name
}

import {
id = /subscriptions/ae58dd56-b863-47df-8495-c7b6ca0af926/resourceGroups/test-rg/providers/Microsoft.Network/virtualNetworks/aks-terraform/subnets/aks-terraform-subnet-1
to = azurerm_subnet.subnet_name
}


resource "azurerm_kubernetes_cluster" "akscluster" {
  name       = "aksterraformcluster"
  location   = azurerm_resource_group.aksrg.location
  resource_group_name = azurerm_resource_group.aksrg.name
  dns_prefix = "aksterraformcluster"

  default_node_pool {
    name       = "default"
    node_count = "1"
    vm_size    = "standard_d2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "mem" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.akscluster.id
  name                  = "mem"
  node_count            = "1"
  vm_size               = "standard_d11_v1"
}
>>>>>>> Stashed changes
