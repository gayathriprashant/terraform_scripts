resource "aws_security_group" "instanceSG" {
  name   = "terraform-test"
  vpc_id = "vpc-2dcd7f57"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["70.120.104.156/32"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["70.120.104.156/32"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["70.120.104.156/32"]
  }
   egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Instancetest"
  }
}
