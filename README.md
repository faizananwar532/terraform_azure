# Terraform Azure Infrastructure

This repository contains Terraform configurations for deploying and managing Azure infrastructure resources, including Azure Kubernetes Service (AKS) and Azure Container Registry (ACR).

## Repository Structure

```
terraform_azure/
├── README.md
├── .gitignore
├── modules/
│   ├── aks/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── acr/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── postgres/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars.example
│   ├── staging/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars.example
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars.example
└── backend.tf
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (>= 1.0.0)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure Subscription
- Proper Azure permissions to create resources

## Authentication Setup

1. Login to Azure CLI:
   ```
   az login
   ```

2. Set the subscription:
   ```
   az account set --subscription "Your Subscription ID"
   ```

3. Create a service principal (optional for automated deployments):
   ```
   az ad sp create-for-rbac --name "terraform-sp" --role Contributor
   ```

## Configuration

1. Copy the example tfvars file and modify it with your settings:
   ```
   cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
   ```

2. Update the backend configuration in `backend.tf` for your state storage:
   ```
   terraform {
     backend "azurerm" {
       resource_group_name   = "your-resource-group"
       storage_account_name  = "your-storage-account"
       container_name        = "tfstate"
       key                   = "dev.terraform.tfstate"
     }
   }
   ```

## Usage

Navigate to the desired environment directory and run:

```bash
# Initialize Terraform
terraform init -backend-config=backend.tfvars

# Plan the deployment
terraform plan -out=tfplan

# Apply the changes
terraform apply tfplan
```

### Environment Variables

You can also use environment variables for sensitive information:

```bash
export TF_VAR_resource_group_name="your-resource-group"
export TF_VAR_administrator_login="db-admin-username"
export TF_VAR_administrator_password="secure-password"
export TF_VAR_cf_api_token="cloudflare-api-token"
```

## Resources Created

This Terraform configuration creates:

- Azure Resource Group (if specified to be created)
- Azure Container Registry (ACR)
- Azure Kubernetes Service (AKS)
- Network configurations for AKS
- Ingress controllers (optional)

## Contributing

Please follow the standard Git workflow:

1. Create a branch for your changes
2. Make your changes
3. Submit a pull request for review

## Security Considerations

- Never commit `.tfvars` files or any files containing secrets
- Use Azure Key Vault for storing sensitive information
- Consider using Terraform Cloud for state management

## Troubleshooting

- If you encounter permissions issues, ensure your account or service principal has the appropriate role assignments
- For AKS connectivity issues, check the network configuration and firewall settings