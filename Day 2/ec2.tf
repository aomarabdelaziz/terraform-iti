resource "aws_instance" "public-private-ec2" {
  ami                         = var.ami
  instance_type               = var.instance-type
  count                       = length(var.subnets)
  subnet_id                   = aws_subnet.subnets[count.index].id
  vpc_security_group_ids      = [aws_security_group.sg-1.id]
  key_name                    = aws_key_pair.sshKey.key_name
  associate_public_ip_address = aws_subnet.subnets[count.index].id == aws_subnet.subnets[0].id ? "true" : "false"
  user_data                   = file(var.user-data)

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = var.ec2-names[count.index]
  }
}
