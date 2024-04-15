resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "app_server" {
  ami                    = "ami-05c13eab67c5d8861"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_default_vpc.default.default_security_group_id]

  tags = {
    Name = var.instance_name
  }
}

