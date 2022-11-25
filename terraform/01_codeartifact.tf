resource "aws_codeartifact_domain" "private_pip_artifact" {
  domain = "pltest-artifact"
}

resource "aws_codeartifact_repository" "pip_usage" {
  repository = "pltest-pip-store"
  domain     = aws_codeartifact_domain.private_pip_artifact.domain

  upstream {
    repository_name = aws_codeartifact_repository.pip_store.repository
  }
}

resource "aws_codeartifact_repository" "pip_store" {
  repository = "pltest-private-python"
  domain     = aws_codeartifact_domain.private_pip_artifact.domain

  upstream {
    repository_name = aws_codeartifact_repository.upstream.repository
  }
}

resource "aws_codeartifact_repository" "upstream" {
  repository = "pltest-public-pip"
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
    sid = "CodeartifactActions"
    actions = [
      "codeartifact:GetAuthorizationToken",
      "codeartifact:GetRepositoryEndpoint",
      "codeartifact:ReadFromRepository"
    ]
    resources = [aws_codeartifact_repository.pip_usage.arn]
  }
  statement {
    sid = "GetTokenforcodeartifact"
    actions = [
      "sts:GetServiceBearerToken",
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "sts:AWSServiceName"

      values = [
        "codeartifact.amazonaws.com",
      ]
    }       
  }
}

resource "aws_iam_policy" "github_codeartifact" {
  name        = "oidc_codeartifact_readonly"
  description = "Permissions to access state bucket and dynamo table"
  policy      = data.aws_iam_policy_document.github_codeartifact.json
}
