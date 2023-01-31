resource "aws_instance" "ubuntu" {
  ami                         = "ami-0b5eea76982371e91"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet-1.id
  vpc_security_group_ids      = [aws_security_group.sg-1.id]
  associate_public_ip_address = "true"
  key_name                    = "private"

  user_data = file("userdata")

  root_block_device {
    volume_size = 8
  }

}