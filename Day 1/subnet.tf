resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = var.subnet-cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public subnet"
  }
}
