provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-1"
}

## Create VPC ##
resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "172.16.0.0/16"

  tags {
    Name = "tf-example"
  }
}

output "aws_vpc_id" {
  value = "${aws_vpc.terraform-vpc.id}"
}
