resource "local_file" "status" {
  filename        = var.filename
  content         = var.content
  file_permission = var.file_permission
}
