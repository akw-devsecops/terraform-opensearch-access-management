### SERVICE-ROLES ###

# create opensearch role for each value in var.applications
resource "opensearch_role" "this" {
  for_each = var.applications

  role_name   = each.key
  description = "Role for ${each.key}"

  cluster_permissions = each.value.cluster_permissions

  index_permissions {
    index_patterns  = each.value.index_patterns
    allowed_actions = each.value.allowed_actions
  }
}

# map each created opensearch role to the related backend role
resource "opensearch_roles_mapping" "mapping_this" {
  for_each    = var.applications
  description = "Mapping AWS IAM backend role to ES role: ${each.key}"

  role_name     = opensearch_role.this[each.key].role_name
  backend_roles = ["arn:aws:iam::${var.account_id}:role/${each.key}-role"]
}


### ADMIN-ROLES ###

# create admin role in opensearch dashboard
resource "opensearch_role" "admin_full_access" {
  role_name   = "admin_full_access"
  description = "Admin role for full access"

  cluster_permissions = ["*"]

  index_permissions {
    index_patterns  = ["*"]
    allowed_actions = ["*"]
  }

  tenant_permissions {
    tenant_patterns = ["*"]
    allowed_actions = ["kibana_all_write"]
  }
}

resource "opensearch_roles_mapping" "admin_full_access" {
  description = "Map admin users to admin_full_access role"
  role_name   = "admin_full_access"
  users       = tolist(var.admin_users)
}

resource "opensearch_roles_mapping" "all_access" {
  description = "Map admin users to all_access role"
  role_name   = "all_access"
  users       = tolist(var.admin_users)
}

resource "opensearch_roles_mapping" "security_manager" {
  description = "Map admin users to security_manager role"
  role_name   = "security_manager"
  users       = tolist(var.admin_users)
}
