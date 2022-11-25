# IAC setup
Project description - build out:
- 01: Infrastructure as code (IAC) project bootstrap with Terraform
- 02: Setup a Terraform CI/CD pipeline with Github action (GHA) using OPENID connect for auth from GHA
- 03: Intro to Standardized Formatting -> Pre-commit and standard styling/formatting for Terraform integrated in GHA pipeline

Outcomes:
01) Bootstrapped project with code in terraform directory - the bootstrap.tf file.
02) In .github/workflows folder the 2 pipelines - terraform-pipeline-pr.yml and terraform-pipeline-main.yml
03) Added terraform-pr-checks.yml pipeline with TFlint and TFsec auto generated TFDocs readme - tf fmt is already in 02 - also added infracost
 
# good blogs for pushing on main
https://joht.github.io/johtizen/build/2022/01/20/github-actions-push-into-repository.html