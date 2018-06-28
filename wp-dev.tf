provider "aws" {
  region     = "ap-southeast-1"
}


terraform {
  backend "s3" {
    bucket = "terraformstate-scb"
    key = "terraformdev.tfstate"
    encrypt = "true"
    region = "ap-southeast-1"
  }
}

resource "aws_instance" "wp-dev" {
  ami           = "ami-a94342d5"
  instance_type = "t2.micro"
  security_groups = ["sg-05043d7c"]
  key_name = "awsfs_sg_kp"
  subnet_id = "subnet-be32b4f7"
  iam_instance_profile = "Terraform-Role"
  tags {
    Name = "wp-dev"
    Type = "Windows"
    Team = "DevOps"
    AppType = "Php"
  }
}
