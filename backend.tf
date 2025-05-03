terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
    config_path = var.kube_config_path
  }
}

provider "kubernetes" {
  config_path = var.kube_config_path
}