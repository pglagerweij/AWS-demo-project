resource "aws_codeartifact_domain" "private_pip_artifact" {
  domain = "pltest-artifact"
}

resource "aws_codeartifact_repository" "pip_store" {
  repository = "pltest-private-python"
  domain     = aws_codeartifact_domain.private_pip_artifact.domain

  upstream {
    repository_name = aws_codeartifact_repository.upstream.repository
  }
}

resource "aws_codeartifact_repository" "upstream" {
  repository = "pltest-pip"
  domain     = aws_codeartifact_domain.private_pip_artifact.domain

  external_connections {
    external_connection_name = "public:pypi"
  }
}

module "github_codeartifact" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 5.8"

  create_role = true

  role_name = "oidc_codeartifact_ro"

  tags = {
    Role = "role-codeartifact-with-oidc"
  }

  provider_url = "token.actions.githubusercontent.com"

  role_policy_arns = [
    aws_iam_policy.github_codeartifact.arn
  ]

  oidc_fully_qualified_subjects = ["repo:${var.github_org_name}/${var.github_repo_name}:pull_request"]
}

data "aws_iam_policy_document" "github_codeartifact" {
  statement {
    sid = "StateBucket"
    actions = [
      "codeartifact:GetAuthorizationToken",
      "codeartifact:ReadFromRepository"
    ]
    resources = ["*"]
  }
  statement {
    sid = "Get token for codeartifact"
    actions = [
      "sts:GetServiceBearerToken",
    ]
    resources = ["*"]
  }

}

resource "aws_iam_policy" "github_codeartifact" {
  name        = "oidc_codeartifact_readonly"
  description = "Permissions to access state bucket and dynamo table"
  policy      = data.aws_iam_policy_document.github_readonly.json
}
