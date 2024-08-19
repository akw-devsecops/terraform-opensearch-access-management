variable "applications" {
  description = "Define the permission for each service role you want to create"
  type = map(object({
    backend_role_names  = set(string)
    cluster_permissions = set(string)
    index_patterns      = set(string)
    allowed_actions     = set(string)
  }))
}

variable "admin_users" {
  type        = set(string)
  description = "Set of your admin users"
}

variable "users" {
  type        = set(string)
  description = "Set of your normal users"
}

variable "enable_audit_logs" {
  type        = bool
  description = "Enable audit logs"
  default     = false
}
