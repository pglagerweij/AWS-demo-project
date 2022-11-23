variable "region" {
  description = "Default region of this terraform project"
  type        = string
}

variable "dynamo_table" {
  description = "Dynamo table name"
  type        = string
}

variable "state_bucket_name" {
  description = "Terraform state file bucket name"
  type        = string
}

variable "github_repo_name" {
  description = "Github repository name"
  type        = string
}

variable "github_org_name" {
  description = "Github organisation name"
  type        = string
}
