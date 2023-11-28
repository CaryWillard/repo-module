variable "repo_name" {
  type = string
}

variable "branch" {
  type        = string
  default     = "main"
  description = "Branch to commit to"
}

variable "parameters" {
  type = object({
    csproj_path   = string
    ports = list(number)
    build_image   = string
    runtime_image = string
  })
}
