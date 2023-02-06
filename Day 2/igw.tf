resource "aws_internet_gateway" "igw-01" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = var.igw-desc-name
  }
}