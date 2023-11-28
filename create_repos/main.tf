resource "github_repository" "repo" {
  name        = "test-repo"
  description = "My awesome codebase"

  visibility = "public"
  auto_init  = true
}
