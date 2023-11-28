locals {
  filename = "platform.yaml"

  templated_file_content = templatefile(
  "${path.module}/${local.filename}.tpl", {})
}

resource "github_repository_file" "platform_file" {
  repository          = var.repo_name
  branch              = var.branch
  file                = local.filename
  content             = local.templated_file_content
  commit_message      = "TF updated ${local.filename}"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = false // If the file exists, do not modify it
}

output "platform_spec" {
  value = yamldecode(github_repository_file.platform_file.content)
}
