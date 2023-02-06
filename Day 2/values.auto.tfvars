provider-region  = "us-east-1"
cidr_block       = "10.0.0.0/16"
vpc-desc-name    = "VPC 01"
igw-desc-name    = "IGW 01"
vpc-az           = "us-east-1a"
subnets          = ["public", "private"]
cidr-subnets     = ["10.0.0.0/20", "10.0.16.0/20"]
ec2-names        = ["Public EC2", "Private EC2"]
ami              = "ami-0b5eea76982371e91"
instance-type    = "t2.micro"
key-name         = "privatePemKey"
user-data        = "userdata"
public-ec2-name  = "Public EC2"
private-ec2-name = "Private EC2"
algorithm        = "RSA"
rsa_bits         = 4096
CustomEIP        = "CustomEIP"
sg-rules = {
  ingress = [
    {
      description = "Allow http inbound traffic"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]

    },
    {
      description = "Allow https inbound traffic"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]

    },
    {
      description = "Allow ssh inbound traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]

    }

  ],
  egress = [
    {
      description = "Allow http outbound traffic"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]

    },
    {
      description = "Allow https outbound traffic"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]

    },
    {
      description = "Allow ssh outbound traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]

    }
  ]
}