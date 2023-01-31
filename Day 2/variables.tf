variable "provider-region" {
  type    = string
  default = "us-east-1"
}
variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc-desc-name" {
  type    = string
  default = "VPC 01"
}

variable "igw-desc-name" {
  type    = string
  default = "IGW 01"
}

variable "vpc-az" {
  type    = string
  default = "us-east-1a"
}
variable "subnets" {
  type = list(string)

}

variable "cidr-subnets" {
  type = list(string)
}
variable "ec2-names" {
  type = list(string)
}
variable "ami" {
  type    = string
  default = "ami-0b5eea76982371e91"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "key-name" {
  type    = string
  default = "private"
}

variable "user-data" {
  type    = string
  default = "userdata"
}

variable "public-ec2-name" {
  type    = string
  default = "Public EC2"
}

variable "private-ec2-name" {
  type    = string
  default = "Private EC2"
}

variable "algorithm" {
  type    = string
  default = "RSA"
}
variable "rsa_bits" {
  type    = number
  default = 4096
}

variable "CustomEIP" {
  type    = string
  default = "CustomEIP"
}
variable "sg-rules" {
  type = object({
    ingress = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = list(string)
    })),
    egress = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = list(string)
    }))
  })
}