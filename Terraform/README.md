## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.68.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api_management"></a> [api\_management](#module\_api\_management) | ./modules/api_management | n/a |
| <a name="module_container_backend"></a> [container\_backend](#module\_container\_backend) | ./modules/container_backend | n/a |
| <a name="module_container_frontend"></a> [container\_frontend](#module\_container\_frontend) | ./modules/container_frontend | n/a |
| <a name="module_custom_vision"></a> [custom\_vision](#module\_custom\_vision) | ./modules/custom_vision | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ./modules/resource_group | n/a |
| <a name="module_storage_account_static_site"></a> [storage\_account\_static\_site](#module\_storage\_account\_static\_site) | ./modules/storage_account | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ./modules/vnet | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cosmos_db_account_name"></a> [cosmos\_db\_account\_name](#input\_cosmos\_db\_account\_name) | The name of the Cosmos DB account | `string` | `"Tefnetcosmosdb"` | no |
| <a name="input_cosmos_db_database_name"></a> [cosmos\_db\_database\_name](#input\_cosmos\_db\_database\_name) | The name of the Cosmos DB database | `string` | `"TefnetDb"` | no |
| <a name="input_custom_vision_name"></a> [custom\_vision\_name](#input\_custom\_vision\_name) | The name of the Cosmos DB database | `string` | `"Tefnet-Custom-Vision"` | no |

## Outputs

No outputs.
