provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "nsg" {
  name = var.nsg
}

resource "aws_security_group_rule" "http_ingress" {
  type             = "ingress"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nsg.id
}

resource "aws_security_group_rule" "https_ingress" {
  type             = "ingress"
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nsg.id
}

resource "aws_security_group_rule" "ssh_ingress" {
  type             = "ingress"
  from_port        = 22
  to_port          = 22
  protocol         = "tcp"
  cidr_blocks      = ["54.210.245.229/32"] # Replace with your IP
  security_group_id = aws_security_group.nsg.id
}

resource "aws_security_group_rule" "allow-egress" {
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nsg.id
}

resource "aws_key_pair" "mykey" {
  key_name   = "rsa_key"
  public_key = file("public_key.pub") # Use a pre-existing public key file.
}

resource "aws_instance" "web" {
  ami                    = var.os
  instance_type          = var.size
  tags = {
    Name = var.name
  }
  vpc_security_group_ids = [aws_security_group.nsg.id]
  key_name               = aws_key_pair.mykey.key_name
}