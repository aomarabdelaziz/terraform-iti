resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc-01.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-01.id
  }

}

resource "aws_route_table_association" "public-subnet-association" {
  subnet_id      = aws_subnet.subnets[0].id
  route_table_id = aws_route_table.public-rt.id
}


resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc-01.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-01.id
  }

}

resource "aws_route_table_association" "private-subnet-association" {
  subnet_id      = aws_subnet.subnets[1].id
  route_table_id = aws_route_table.private-rt.id
}
