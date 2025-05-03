variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
  default     = "akscluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = null # Uses the latest supported version by default
}

variable "default_node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for the nodes in the default node pool"
  type        = string
  default     = "Standard_B2s"
}

variable "os_disk_size_gb" {
  description = "OS disk size for the nodes"
  type        = number
  default     = 30
}

variable "enable_auto_scaling" {
  description = "Enable auto scaling for the default node pool"
  type        = bool
  default     = false
}

variable "min_count" {
  description = "Minimum number of nodes when auto scaling is enabled"
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes when auto scaling is enabled"
  type        = number
  default     = 3
}

variable "vnet_subnet_id" {
  description = "Subnet ID for the AKS cluster"
  type        = string
  default     = null
}

variable "network_plugin" {
  description = "Network plugin for the AKS cluster"
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "Network policy for the AKS cluster"
  type        = string
  default     = null
}

variable "service_cidr" {
  description = "CIDR for Kubernetes services"
  type        = string
  default     = null
}

variable "dns_service_ip" {
  description = "IP address for Kubernetes DNS service"
  type        = string
  default     = null
}

variable "docker_bridge_cidr" {
  description = "CIDR for the Docker bridge network"
  type        = string
  default     = null
}

variable "outbound_type" {
  description = "Outbound type for the AKS cluster"
  type        = string
  default     = "loadBalancer"
}

variable "additional_node_pools" {
  description = "Additional node pools to create"
  type = map(object({
    vm_size             = string
    node_count          = number
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
    os_disk_size_gb     = number
    node_labels         = map(string)
    node_taints         = list(string)
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}