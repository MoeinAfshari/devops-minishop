output "generated_file_path" {
  description = "Path to the generated MiniShop lab file."
  value       = local_file.minishop_status.filename
}

output "environment_name" {
  description = "Environment selected for the local lab."
  value       = var.environment_name
}
