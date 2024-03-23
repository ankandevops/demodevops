provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.nano"

  tags = {
    Name = "myec2"
    env= "Prod"

  }
}
terraform {
  backend "s3" {
    bucket = "ankans3"
    key    = "ec2/terraform.tfstate"
    region = "us-west-2"
  }
}
