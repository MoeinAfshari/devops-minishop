resource "local_file" "minishop_status" {
  filename        = "${path.module}/generated/minishop-lab-status.txt"
  content         = "MiniShop local IaC lab\nEnvironment: ${var.environment_name}\nPurpose: Terraform practice only\n"
  file_permission = "0644"
}
