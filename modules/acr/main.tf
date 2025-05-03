resource "azurerm_container_registry" "acr" {
  name                     = var.azure_container_registry
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku
  admin_enabled            = var.admin_enabled
  
  tags = var.tags
}

# Assign AKS the AcrPull role on the ACR if aks_object_id is provided
resource "azurerm_role_assignment" "aks_to_acr" {
  count                = var.aks_object_id != "" ? 1 : 0
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = var.aks_object_id
}