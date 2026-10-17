output "generated_file_path" {
  description = "Path to the generated MiniShop lab file."
  value       = local_file.minishop_status.filename
}
