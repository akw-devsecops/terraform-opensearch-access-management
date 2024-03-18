variable "account_id" {
  description = "AWS Account id"
  type        = string
}

variable "applications" {
  description = "Define the permission for each service role you want to create"
  type = map(object({
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
