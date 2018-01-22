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
  ami = "ami-1f279a67"
  instance_type = "t2.nano"
  security_groups = ["terraform-worker"]
  tags = {
    group = "worker"
  }
  count = 2
}
