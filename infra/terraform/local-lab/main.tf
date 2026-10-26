module "status_file" {
  source          = "./modules/status_file"
  filename        = local.status_file_path
  content         = var.status_content
  file_permission = var.status_file_permission
}

moved {
  from = local_file.minishop_status
  to   = module.status_file.local_file.status
}
