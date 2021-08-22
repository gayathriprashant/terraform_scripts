resource "aws_eip" "staticip" {
  vpc      = true
  count = 2
  tags = {
    Name = "StaticIP${count.index}"
  }
}