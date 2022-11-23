resource "aws_dynamodb_table" "tf_tst-testing" {
  name         = "table-test"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}