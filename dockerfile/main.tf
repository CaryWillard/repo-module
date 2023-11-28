locals {
  csproj_path = lookup(var.parameters, "csproj_path")
  dockerfile = templatefile(
    "${path.module}/dockerfile.tpl",
    {
      csproj_path   = local.csproj_path,
      csproj_name   = basename(local.csproj_path),
      ports = lookup(var.parameters, "ports"),
      runtime_image = lookup(var.parameters, "runtime_image"),
      build_image   = lookup(var.parameters, "build_image"),
  })
}

resource "github_repository_file" "dockerfile" {
  repository          = var.repo_name
  branch              = var.branch
  file                = "Dockerfile"
  content             = local.dockerfile
  commit_message      = "TF updated Dockerfile"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}
