provider "aws" {
  shared_credentials_file = "/root/terraform/users/aws/tf-user1/creds"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-011b3ccf1bd6db744"
  instance_type = "t2.micro"
}
