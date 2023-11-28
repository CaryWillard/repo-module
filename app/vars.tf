variable "repo_name" {
  type = string
}

variable "branch" {
  type        = string
  default     = "main"
  description = "Branch to commit the file to"
}

variable "app_spec" {
  type = object({
    name = string
    dockerfile = object({
      ports         = list(number)
      csproj_path   = string
      build_image   = string
      runtime_image = string
    })
  })
}
