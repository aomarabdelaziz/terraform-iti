resource "aws_vpc" "vpc-01" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc-desc-name
  }

}
