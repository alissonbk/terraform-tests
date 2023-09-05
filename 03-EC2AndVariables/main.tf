

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

#VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-example"
  }
}
resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

#EC2Instance
resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }
  credit_specification {
    cpu_credits = "standard"
  }

  tags = var.instance_tags
}