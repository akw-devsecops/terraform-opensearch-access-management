output "admin_role" {
  description = "Admin Role Name"
  value       = opensearch_role.admin_full_access.role_name
}

output "services_roles" {
  description = "Service Roles"
  value       = { for k, v in opensearch_role.this : k => v.role_name }
}
