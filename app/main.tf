module "dockerfile" {
  source = "../dockerfile"
  count  = var.app_spec.dockerfile == null ? 0 : 1

  repo_name  = var.repo_name
  branch     = var.branch
  parameters = var.app_spec.dockerfile
}
