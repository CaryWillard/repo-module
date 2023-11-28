variable "repo_name" {
  type = string
}

variable "branch" {
  type        = string
  default     = "main"
  description = "Branch to commit to"
}
