provider "aws" {
  access_key = "AKIAJAVWCXU27BMPTMVQ"
  secret_key = "0UzPQKYAaYN3XDvLx5QnmSz/fevixgZJimmJjkai"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}
