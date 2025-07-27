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

variable "vpc_id" {
  type        = string
  description = "VPC ID for CodeBuild runner"
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for CodeBuild runner"
  default     = []
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs for CodeBuild runner"
  default     = []
}
