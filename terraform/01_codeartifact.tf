resource "aws_codeartifact_domain" "private-pip-artifact" {
  domain = "pltest-artifact"
}

resource "aws_codeartifact_repository" "pip_store" {
  repository = "pltest-private-python"
  domain     = aws_codeartifact_domain.private-pip-artifact.domain

  upstream {
    repository_name = aws_codeartifact_repository.upstream.repository
  }
}

resource "aws_codeartifact_repository" "upstream" {
  repository = "pltest-pip"
  domain     = aws_codeartifact_domain.private-pip-artifact.domain

  external_connections {
    external_connection_name = "public:pypi"
  }
}