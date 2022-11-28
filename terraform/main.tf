resource "aws_instance" "foo-wrong-syntax" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t1.2xlllllarge" # invalid type!
}