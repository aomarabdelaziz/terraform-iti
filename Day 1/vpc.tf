resource "aws_vpc" "vpc-1" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Public VPC"
  }
}