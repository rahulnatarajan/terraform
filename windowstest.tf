provider "aws" {
  region     = "ap-southeast-1"
}


terraform {
  backend "s3" {
    bucket = "terraformstate-scb"
    key = "terraform.tfstate"
    encrypt = "true"
    region = "ap-southeast-1"
  }
}

resource "aws_instance" "Ansible-Windows" {
  ami           = "ami-a94342d5"
  instance_type = "t2.micro"
  security_groups = ["sg-05043d7c"]
  subnet_id = "subnet-be32b4f7"
  tags {
    Name = "Anisble-Windows"
    Type = "Windows"
    Team = "DevOps"
  }
}
