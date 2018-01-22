terraform {
  backend "s3" {
    bucket = "terraform-worker"
    key = "worker.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "worker" {
  ami = "ami-173f826f"
  instance_type = "t2.nano"
  count = 10
}
