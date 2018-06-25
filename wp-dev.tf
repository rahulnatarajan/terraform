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
  ami           = "ami-de90a5a2"
  instance_type = "t2.micro"
  security_groups = ["sg-7e5eb406"]
  key_name = "awsfs_sg_kp"
  subnet_id = "subnet-06192061"
  iam_instance_profile = "Terraform-Role"
  tags {
    Name = "wp-dev"
    Type = "Linux"
    Team = "DevOps"
    Owner = "SCB"
    AppType = "Php"
  }
}
