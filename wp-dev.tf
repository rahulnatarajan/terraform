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
  ami           = "ami-<>"
  instance_type = "t2.micro"
  security_groups = ["sg-<>"]
  key_name = "awsfs_sg_kp"
  subnet_id = "subnet-<>"
  iam_instance_profile = "Terraform-Role"
  tags {
    Name = "wp-dev"
    Type = "Linux"
    Team = "DevOps"
    AppType = "Php"
  }
}
