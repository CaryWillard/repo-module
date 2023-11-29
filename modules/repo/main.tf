# data "github_repository" "repo" {
#   name        = var.repo_name
#   description = "My awesome codebase"
# }

# resource "github_branch" "default" {
#   repository = github_repository.example.name
#   branch     = var.default_branch
# }

# resource "github_branch_default" "default" {
#   repository = github_repository.example.name
#   branch     = github_branch.development.branch
#   rename     = true
# }

locals {
  spec = var.config == null ? null : yamldecode(var.config)
}

module "apps" {
  source    = "../app"
  for_each  = local.spec == null ? {} : zipmap(local.spec.apps[*].name, local.spec.apps[*])
  app_spec  = each.value
  repo_name = var.repo_name
  branch    = var.default_branch
}
