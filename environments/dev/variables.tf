variable "region" {
    default     = "uksouth"
    description = "Azure region to be used"
    type        = string
}

variable "resource_group_name" {
    description = "Azure resource group name"
    type        = string
    sensitive   = true
}

variable "storage_account_name" {
    description = "Azure storage account name"
    type        = string
    sensitive   = true
}

variable "azure_container_registry" {
    description = "Azure Container Registry name"
    type        = string
    default     = "aequitascr"
}

variable "cluster_name" {
    default     = "aequitas_st"
    description = "Kubernetes cluster name"
    type        = string
}

variable "cluster_nodepool" {
    default     = "Standard_B2s"
    description = "Nodepool VM size for k8s cluster for dev env"
    type        = string
}

variable "ingress_name" {
    default     = "aequitas-ingress"
    description = "Name of ingress resource in k8s"
    type        = string
}

variable "cf_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "administrator_login" {
  description = "PostgreSQL admin username"
  type        = string
  sensitive   = true
}

variable "administrator_password" {
  description = "PostgreSQL admin password"
  type        = string
  sensitive   = true
}

variable "kube_config_path" {
  description = "Path to the kube config file"
  type        = string
  default     = "~/.kube/config"
}