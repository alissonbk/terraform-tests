resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "${var.aws_region}a"

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


resource "aws_instance" "instance" {
  count         = local.instance_number <= 0 ? 0 : local.instance_number
  ami           = var.instance_ami
  instance_type = local.instance_type
  subnet_id = aws_subnet.my_subnet.id
  # network_interface {
  #   network_interface_id = aws_network_interface.foo.id
  #   device_index         = count.index
  # }
  tags = merge(
    local.common_tags,
    {
      Project = "Testing merge tags"
      Name    = format("Instance number %d", count.index + 1)
    }
  )
}