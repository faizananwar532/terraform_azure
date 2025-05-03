locals {
  common_tags = {
    Environment = "Development"
    Project     = "DEVOPS"
    ManagedBy   = "Terraform"
  }
}

# Resource Group - Uncomment if you need to create a new Resource Group
# resource "azurerm_resource_group" "main" {
#   name     = var.resource_group_name
#   location = var.region
#   tags     = local.common_tags
# }

# Create Azure Container Registry
module "acr" {
  source                  = "../../modules/acr"
  azure_container_registry = var.azure_container_registry
  resource_group_name     = var.resource_group_name
  location                = var.region
  sku                     = "Basic"
  admin_enabled           = true
  tags                    = local.common_tags
  aks_object_id           = module.aks.kubelet_identity[0].object_id
}

# Create AKS cluster
module "aks" {
  source              = "../../modules/aks"
  cluster_name        = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.region
  dns_prefix          = "akscluster"
  vm_size             = var.cluster_nodepool
  tags                = local.common_tags
  
  # Network configuration
  network_plugin      = "azure"
  
  # Enable auto-scaling for production-like environments
  enable_auto_scaling = true
  min_count           = 1
  max_count           = 3
}

# Optional: Deploy ingress controller
resource "helm_release" "ingress_nginx" {
  name       = var.ingress_name
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true
  
  set {
    name  = "controller.replicaCount"
    value = "1"
  }
  
  set {
    name  = "controller.nodeSelector\\.kubernetes\\.io/os"
    value = "linux"
  }
  
  depends_on = [
    module.aks
  ]
}