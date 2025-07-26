variable "github_pat" {
  type        = string
  description = "GitHub Personal Access Token (See https://docs.aws.amazon.com/codebuild/latest/userguide/access-tokens-github.html#access-tokens-github-prereqs)"
  sensitive   = true
  default     = ""
}

variable "repository_name" {
  type        = string
  description = "GitHub repository name (e.g. octo-org/octo-template)"
}