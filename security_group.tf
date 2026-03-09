resource "aws_security_group" "bastion_vpc1" {
  name        = "bastion"
  description = "Bastion Security Group"
  vpc_id      = aws_vpc.vpc1.id

  tags = {
    Name       = "bastion"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_vpc_security_group_ingress_rule" "bastion" {
  security_group_id = aws_security_group.bastion.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name       = "bastion"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_egress_rule" "bastion" {
  security_group_id = aws_security_group.bastion.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"

  tags = {
    Name       = "bastion"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_security_group" "bird_vpc1" {
  name        = "bird"
  description = "Bird Security Group"
  vpc_id      = aws_vpc.vpc1.id

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_vpc_security_group_ingress_rule" "bird" {
  security_group_id = aws_security_group.bird.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_egress_rule" "bird" {
  security_group_id = aws_security_group.bird.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_security_group" "bird_vpc2" {
  name        = "bird"
  description = "Bird Security Group"
  vpc_id      = aws_vpc.vpc2.id

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_vpc_security_group_ingress_rule" "bird" {
  security_group_id = aws_security_group.bird.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_egress_rule" "bird" {
  security_group_id = aws_security_group.bird.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_security_group" "bird_vpc3" {
  name        = "bird"
  description = "Bird Security Group"
  vpc_id      = aws_vpc.vpc3.id

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_vpc_security_group_ingress_rule" "bird" {
  security_group_id = aws_security_group.bird.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_egress_rule" "bird" {
  security_group_id = aws_security_group.bird.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"

  tags = {
    Name       = "bird"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}
