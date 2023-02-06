resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.vpc-1.id
  tags = {
    Name = "Public IGW"
  }
}