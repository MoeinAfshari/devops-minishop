output "filename" {
  description = "Path of the managed status file."
  value       = local_file.status.filename
}

output "id" {
  description = "ID of the managed status file."
  value       = local_file.status.id
}
