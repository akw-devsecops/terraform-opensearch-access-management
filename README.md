<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_opensearch"></a> [opensearch](#requirement\_opensearch) | >= 2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_opensearch"></a> [opensearch](#provider\_opensearch) | >= 2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [opensearch_role.admin_full_access](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/role) | resource |
| [opensearch_role.this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/role) | resource |
| [opensearch_roles_mapping.admin_full_access](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/roles_mapping) | resource |
| [opensearch_roles_mapping.all_access](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/roles_mapping) | resource |
| [opensearch_roles_mapping.mapping_this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/roles_mapping) | resource |
| [opensearch_roles_mapping.security_manager](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/roles_mapping) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_users"></a> [admin\_users](#input\_admin\_users) | Set of your admin users | `set(string)` | n/a | yes |
| <a name="input_applications"></a> [applications](#input\_applications) | Define the permission for each service role you want to create | <pre>map(object({<br>    backend_role_names  = set(string)<br>    cluster_permissions = set(string)<br>    index_patterns      = set(string)<br>    allowed_actions     = set(string)<br>  }))</pre> | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | Set of your normal users | `set(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_role"></a> [admin\_role](#output\_admin\_role) | Admin Role Name |
| <a name="output_services_roles"></a> [services\_roles](#output\_services\_roles) | Service Roles |
<!-- END_TF_DOCS -->