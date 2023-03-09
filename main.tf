provider "aws" {
  region = "us-east-2"
}

resource "aws_default_vpc" "default" {

}


resource "aws_instance" "terraforminstacne1" {
  ami           = "ami-0cc87e5027adcdca8"
  instance_type = "t2.micro"
  key_name      = "testkey"
  tags = {
    Name = "terraforminstacne1"

  }
}
