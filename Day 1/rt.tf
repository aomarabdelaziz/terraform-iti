resource "aws_route_table" "route-table-test-env" {
  vpc_id = aws_vpc.vpc-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-1.id
  }

}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.route-table-test-env.id
}
