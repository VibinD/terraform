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

## Security Group##
resource "aws_security_group" "terraform_private_sg" {
  description = "Allow limited inbound external traffic"
  vpc_id      = "${aws_vpc.terraform-vpc.id}"
  name        = "terraform_ec2_private_sg"

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    to_port     = 8080
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
  }

  egress {
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags {
    Name = "ec2-private-sg"
  }
}

output "aws_security_gr_id" {
  value = "${aws_security_group.terraform_private_sg.id}"
}

## Create Subnets ##
resource "aws_subnet" "terraform-subnet_1" {
  vpc_id     = "${aws_vpc.terraform-vpc.id}"
  cidr_block = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = "terraform-subnet_1"
  }
}

output "aws_subnet_subnet_1" {
  value = "${aws_subnet.terraform-subnet_1.id}"
}

resource "aws_network_interface" "terraform_nw_interface" {
  subnet_id = "${aws_subnet.terraform-subnet_1.id}"
  private_ips = ["172.16.10.100"]
  security_groups = ["${aws_security_group.terraform_private_sg.id}"]
  tags {
    Name = "terraform_network_interface"
  }
}

output "aws_interface_id" {
  value = "${aws_network_interface.terraform_nw_interface.id}"
}

resource "aws_instance" "terraform_wapp" {
    ami = "ami-b70554c8"
    instance_type = "t2.micro"
    network_interface {
      network_interface_id = "${aws_network_interface.terraform_nw_interface.id}"
      device_index = 0
    }
    key_name               = "terraform-demo"
    tags {
      Name              = "terraform_ec2_wapp_awsdev"
      Environment       = "development"
      Project           = "DEMO-TERRAFORM"
    }
}
