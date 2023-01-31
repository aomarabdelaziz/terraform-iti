resource "aws_security_group" "sg-1" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc-01.id


  /* ingress = [for r in var.sg-rules.ingress : {
    description      = r.description
    from_port        = r.from_port
    to_port          = r.to_port
    protocol         = r.protocol
    cidr_blocks      = r.cidr_block
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]

  egress = [for r in var.sg-rules.egress : {
    description = r.description

    from_port        = r.from_port
    to_port          = r.to_port
    protocol         = r.protocol
    cidr_blocks      = r.cidr_block
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }] */

}


resource "aws_security_group_rule" "allow_all-ingress" {
  type              = "ingress"
  count             = length(var.sg-rules.ingress)
  description       = var.sg-rules.ingress[count.index].description
  from_port         = var.sg-rules.ingress[count.index].from_port
  to_port           = var.sg-rules.ingress[count.index].to_port
  protocol          = var.sg-rules.ingress[count.index].protocol
  cidr_blocks       = var.sg-rules.ingress[count.index].cidr_blocks
  security_group_id = aws_security_group.sg-1.id
}

resource "aws_security_group_rule" "allow_all-egress" {
  type              = "egress"
  count             = length(var.sg-rules.egress)
  description       = var.sg-rules.egress[count.index].description
  from_port         = var.sg-rules.egress[count.index].from_port
  to_port           = var.sg-rules.egress[count.index].to_port
  protocol          = var.sg-rules.egress[count.index].protocol
  cidr_blocks       = var.sg-rules.egress[count.index].cidr_blocks
  security_group_id = aws_security_group.sg-1.id
}  