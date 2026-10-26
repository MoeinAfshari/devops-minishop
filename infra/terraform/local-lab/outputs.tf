output "environment_name" {
  description = "Environment selected for the local lab."
  value       = var.environment_name
}

output "status_file_path" {
  description = "Path of the MiniShop status file."
  value       = module.status_file.filename
}

output "status_file_id" {
  description = "ID of the MiniShop status file."
  value       = module.status_file.id
}
