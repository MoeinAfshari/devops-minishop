locals {
  project_name = "minishop"

  status_file_path = "${path.root}/generated/${local.project_name}-lab-status.txt"
}
