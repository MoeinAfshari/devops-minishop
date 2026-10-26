variable "project_name" {
  description = "Name of the application."
  type        = string
  default     = "minishop"

  validation {
    condition     = length(trimspace(var.project_name)) > 0
    error_message = "project_name must not be empty."
  }
}

variable "environment_name" {
  description = "Name of the MiniShop local lab environment."
  type        = string
  default     = "development"

  validation {
    condition = contains(
      ["development", "staging", "production"],
      var.environment_name
    )
    error_message = "environment_name must be development, staging or production."
  }
}

variable "status_content" {
  description = "Content of the MiniShop status file."
  type        = string
  default     = "Application: minishop\nEnvironment: development\nPurpose: Terraform local lab only"
}

variable "status_file_permission" {
  description = "Permission of the status file."
  type        = string
  default     = 0644
}
