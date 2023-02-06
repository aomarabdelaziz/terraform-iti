resource "aws_subnet" "subnets" {
  vpc_id            = aws_vpc.vpc-01.id
  availability_zone = var.vpc-az
  count             = length(var.subnets)
  cidr_block        = var.cidr-subnets[count.index]
  tags = {
    Name = var.subnets[count.index]
  }
}