resource "github_repository" "repo" {
  name        = var.repo_name
  description = "My awesome codebase"

  visibility = "public"
  auto_init  = true
}

resource "github_branch_default" "default" {
  repository = github_repository.repo.name
  branch     = var.default_branch
  rename     = true
}

data "github_repository_file" "platform_file" {
  repository          = github_repository.repo.name
  branch              = github_branch_default.default.branch
  file                = "platform.yaml"
}

locals {
  spec = yamldecode(data.github_repository_file.platform_file.content)
}

module "apps" {
  source   = "./app"
  for_each = zipmap(local.spec.apps[*].name, local.spec.apps[*])
  app_spec = each.value

  repo_name = github_repository.repo.name
  branch    = github_branch_default.default.branch
}
