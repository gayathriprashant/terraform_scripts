provider "aws" {
  region = "us-east-1"
}
data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_instance" "instanceip" {
  ami           = "ami-04763b3055de4860b"
  count = 2
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.instanceSG.id]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  user_data              = file("cassandra.sh")
  key_name = "sample"
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  tags = {
    Name = "InstanceIP${count.index}"
  }
}
resource "aws_eip_association" "eip_assoc" {
        count = 2
  instance_id   = aws_instance.instanceip.*.id[count.index]
  allocation_id = aws_eip.staticip.*.id[count.index]
}



