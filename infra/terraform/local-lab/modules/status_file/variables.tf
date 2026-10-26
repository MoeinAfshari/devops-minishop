variable "filename" {
  description = "Path of the MiniShop status file."
  type        = string
}

variable "content" {
  description = "Content of the MiniShop status file"
  type        = string
}

variable "file_permission" {
  description = "Permission of the output file."
  type        = string
  default     = null
}
