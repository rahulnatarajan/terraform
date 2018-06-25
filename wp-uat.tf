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
  ami           = "ami-de90a5a2"
  instance_type = "t2.medium"
  security_groups = ["sg-a745afdf"]
  subnet_id = "subnet-9b251cfc"
  tags {
    Name = "wp-uat"
    Type = "Linux"
    Team = "DevOps"
    Owner = "SCB"
    AppType = "Php"
  }
}
