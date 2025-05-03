output "id" {
  description = "The ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "kube_config_raw" {
  description = "Raw Kubernetes config for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive   = true
}

output "kube_admin_config_raw" {
  description = "Raw Kubernetes admin config for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config_raw
  sensitive   = true
}

output "host" {
  description = "The Kubernetes cluster server host"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
  sensitive   = true
}

output "client_certificate" {
  description = "Base64 encoded client certificate for authenticating to the Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Base64 encoded client key for authenticating to the Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Base64 encoded cluster CA certificate"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate
  sensitive   = true
}

output "node_resource_group" {
  description = "Auto-generated resource group which contains the resources for this managed Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
}

output "kubelet_identity" {
  description = "The Kubelet identity of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity
}

output "identity" {
  description = "The identity of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.identity
}