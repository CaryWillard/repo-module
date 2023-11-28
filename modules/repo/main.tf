resource "github_branch_default" "default" {
  repository = var.repo_name
  branch     = var.default_branch
  rename     = true
}

data "github_repository_file" "platform_file" {
  repository          = var.repo_name
  branch              = github_branch_default.default.branch
  file                = "platform.yaml"
}

locals {
  spec = data.github_repository_file.platform_file == null ? null : (data.github_repository_file.platform_file.content)
}

module "apps" {
  source   = "../app"
  for_each = local.spec == null ? [] : zipmap(local.spec.apps[*].name, local.spec.apps[*])
  app_spec = each.value
  repo_name = var.repo_name
  branch    = github_branch_default.default.branch
}
