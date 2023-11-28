resource "github_repository" "repo" {
  name        = "test-repo"
  description = "My awesome codebase"

  visibility = "public"
  auto_init  = true
}

resource "github_branch_default" "default" {
  repository = github_repository.repo.name
  branch     = "main"
  rename     = true
}

module "platform_config" {
  source = "./platform_config"

  repo_name = github_repository.repo.name
  branch    = github_branch_default.default.branch
}

locals {
  spec = module.platform_config.platform_spec
}

module "apps" {
  source   = "./app"
  for_each = zipmap(local.spec.apps[*].name, local.spec.apps[*])
  app_spec = each.value

  repo_name = github_repository.repo.name
  branch    = github_branch_default.default.branch
}
