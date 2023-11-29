variable "repo_name" {
  type = string
}

variable "default_branch" {
  type    = string
  default = "main"
}

variable "config" {
  type    = string
  default = null
}
