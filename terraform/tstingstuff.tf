resource "aws_dynamodb_table" "terraform-tst_tflint" {
  name         = "table2"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t1.2xlaaaaaaarge" # invalid type!
}