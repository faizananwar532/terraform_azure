region                  = "uksouth"
resource_group_name      = "rg-devops-dev"
storage_account_name     = "stgdevopsdev"
azure_container_registry = "devopscr"
cluster_name             = "devops-dev"
cluster_nodepool         = "Standard_B2s"
ingress_name             = "devops-ingress"

# Sensitive values - do not commit actual values to version control
# cf_api_token          = "your-cloudflare-api-token"
# administrator_login   = "postgres-admin"
# administrator_password = "secure-password"