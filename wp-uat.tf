provider "aws" {
  region     = "ap-southeast-1"
}


terraform {
  backend "s3" {
    bucket = "terraformstate-scb"
    key = "terraformuat.tfstate"
    encrypt = "true"
    region = "ap-southeast-1"
  }
}

resource "aws_instance" "wp-uat" {
  ami           = "ami-<>"
  instance_type = "t2.medium"
  security_groups = ["sg-<>"]
  subnet_id = "subnet-<>"
  key_name = "awsfs_sg_kp"
  iam_instance_profile = "Terraform-Role"
  tags {
    Name = "wp-uat"
    Type = "Linux"
    Team = "DevOps"
    AppType = "Php"
  }
}
