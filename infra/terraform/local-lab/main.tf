locals {
  status_content = join("\n", [
    "Application: ${var.project_name}",
    "Environment: ${var.environment_name}",
    "Purpose: Terraform local lab only"
  ])
}

resource "local_file" "minishop_status" {
  filename        = "${path.module}/generated/minishop-lab-status.txt"
  content         = "${local.status_content}\n"
  file_permission = "0644"
}

moved {
  from = local_file.minishop_lab
  to = local_file.minishop_status
}
