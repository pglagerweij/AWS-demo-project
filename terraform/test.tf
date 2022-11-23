resource "aws_dynamodb_table" "terraform-tst" {
  name         = "tsttable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}