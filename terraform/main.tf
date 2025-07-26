locals {
  ssm_parameter_name     = "/github/runner/${var.repository_name}"
  codebuild_project_name = "github-runner-${replace(var.repository_name, "/", "_")}"
  github_full_url        = "https://github.com/${var.repository_name}"
}

resource "aws_ssm_parameter" "github_pat" {
  type             = "SecureString"
  name             = local.ssm_parameter_name
  value_wo         = var.github_pat
  value_wo_version = "1"

  lifecycle {
    ignore_changes = [
      value_wo
    ]
  }
}

module "github-runners" {
  source  = "cloudandthings/github-runners/aws"
  version = "3.0.1"

  depends_on = [
    aws_ssm_parameter.github_pat
  ]

  name            = local.codebuild_project_name
  source_location = local.github_full_url

  github_personal_access_token_ssm_parameter = aws_ssm_parameter.github_pat.name
}
