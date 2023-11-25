terraform {
  cloud {
    organization = "suncoast-cloud"
    workspaces {
      name = "terraform"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

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

