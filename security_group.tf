# Bastion Security Group (VPC1)
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

resource "aws_vpc_security_group_ingress_rule" "bastion_ssh" {
  security_group_id = aws_security_group.bastion_vpc1.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name       = "bastion_ssh"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_egress_rule" "bastion_all" {
  security_group_id = aws_security_group.bastion_vpc1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name       = "bastion_egress"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


# BIRD Security Group - VPC1
resource "aws_security_group" "bird_vpc1" {
  name        = "bird"
  description = "Bird Security Group"
  vpc_id      = aws_vpc.vpc1.id

  tags = {
    Name       = "bird_vpc1"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc1_ssh" {
  security_group_id = aws_security_group.bird_vpc1.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird_vpc1_ssh"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc1_icmp" {
  security_group_id = aws_security_group.bird_vpc1.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"

  tags = {
    Name       = "bird_vpc1_icmp"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc1_bgp" {
  security_group_id = aws_security_group.bird_vpc1.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 179
  to_port           = 179
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird_vpc1_bgp"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_egress_rule" "bird_vpc1_all" {
  security_group_id = aws_security_group.bird_vpc1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name       = "bird_vpc1_egress"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


# BIRD Security Group - VPC2
resource "aws_security_group" "bird_vpc2" {
  name        = "bird"
  description = "Bird Security Group"
  vpc_id      = aws_vpc.vpc2.id

  tags = {
    Name       = "bird_vpc2"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc2_ssh" {
  security_group_id = aws_security_group.bird_vpc2.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird_vpc2_ssh"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc2_icmp" {
  security_group_id = aws_security_group.bird_vpc2.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"

  tags = {
    Name       = "bird_vpc2_icmp"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc2_bgp" {
  security_group_id = aws_security_group.bird_vpc2.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 179
  to_port           = 179
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird_vpc2_bgp"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_egress_rule" "bird_vpc2_all" {
  security_group_id = aws_security_group.bird_vpc2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name       = "bird_vpc2_egress"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


# BIRD Security Group - VPC3
resource "aws_security_group" "bird_vpc3" {
  name        = "bird"
  description = "Bird Security Group"
  vpc_id      = aws_vpc.vpc3.id

  tags = {
    Name       = "bird_vpc3"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc3_ssh" {
  security_group_id = aws_security_group.bird_vpc3.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird_vpc3_ssh"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc3_icmp" {
  security_group_id = aws_security_group.bird_vpc3.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"

  tags = {
    Name       = "bird_vpc3_icmp"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_ingress_rule" "bird_vpc3_bgp" {
  security_group_id = aws_security_group.bird_vpc3.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 179
  to_port           = 179
  ip_protocol       = "tcp"

  tags = {
    Name       = "bird_vpc3_bgp"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc_security_group_egress_rule" "bird_vpc3_all" {
  security_group_id = aws_security_group.bird_vpc3.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name       = "bird_vpc3_egress"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}
