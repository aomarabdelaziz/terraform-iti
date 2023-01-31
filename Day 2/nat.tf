resource "aws_nat_gateway" "nat-01" {
  allocation_id = aws_eip.CustomEIP.id
  subnet_id     = aws_subnet.subnets[0].id
}