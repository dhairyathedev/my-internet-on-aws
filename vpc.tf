resource "aws_vpc" "vpc1" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name       = "vpc1"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_vpc" "vpc2" {
  cidr_block = "10.2.0.0/16"

  tags = {
    Name       = "vpc2"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_vpc" "vpc3" {
  cidr_block = "10.3.0.0/16"

  tags = {
    Name       = "vpc3"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


resource "aws_subnet" "vpc1_public" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name       = "vpc1_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc1_private" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name       = "vpc1_private"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc2_public" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name       = "vpc2_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc2_private" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.2.2.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name       = "vpc2_private"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc3_public" {
  vpc_id            = aws_vpc.vpc3.id
  cidr_block        = "10.3.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name       = "vpc3_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc3_private" {
  vpc_id            = aws_vpc.vpc3.id
  cidr_block        = "10.3.2.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name       = "vpc3_private"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_internet_gateway" "vpc1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name       = "vpc1_igw"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_internet_gateway" "vpc2" {
  vpc_id = aws_vpc.vpc2.id

  tags = {
    Name       = "vpc2_igw"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_internet_gateway" "vpc3" {
  vpc_id = aws_vpc.vpc3.id

  tags = {
    Name       = "vpc3_igw"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_route_table" "vpc1_public" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name       = "vpc1_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_route_table" "vpc2_public" {
  vpc_id = aws_vpc.vpc2.id

  tags = {
    Name       = "vpc2_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_route_table" "vpc3_public" {
  vpc_id = aws_vpc.vpc3.id

  tags = {
    Name       = "vpc3_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_route" "vpc1_public" {
  route_table_id         = aws_route_table.vpc1_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1.id
}

resource "aws_route" "vpc2_public" {
  route_table_id         = aws_route_table.vpc2_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc2.id
}

resource "aws_route" "vpc3_public" {
  route_table_id         = aws_route_table.vpc3_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc3.id
}

resource "aws_route" "tgw_global_route_vpc1" {
  route_table_id         = aws_route_table.vpc1_public.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.ixp.id
}

resource "aws_route" "tgw_global_route_vpc2" {
  route_table_id         = aws_route_table.vpc2_public.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.ixp.id
}

resource "aws_route" "tgw_global_route_vpc3" {
  route_table_id         = aws_route_table.vpc3_public.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.ixp.id
}

# Public subnet route table associations
resource "aws_route_table_association" "vpc1_public" {
  subnet_id      = aws_subnet.vpc1_public.id
  route_table_id = aws_route_table.vpc1_public.id
}

resource "aws_route_table_association" "vpc2_public" {
  subnet_id      = aws_subnet.vpc2_public.id
  route_table_id = aws_route_table.vpc2_public.id
}

resource "aws_route_table_association" "vpc3_public" {
  subnet_id      = aws_subnet.vpc3_public.id
  route_table_id = aws_route_table.vpc3_public.id
}

# Private route tables
resource "aws_route_table" "vpc1_private" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name       = "vpc1_private"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_route_table" "vpc2_private" {
  vpc_id = aws_vpc.vpc2.id

  tags = {
    Name       = "vpc2_private"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_route_table" "vpc3_private" {
  vpc_id = aws_vpc.vpc3.id

  tags = {
    Name       = "vpc3_private"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

# TGW routes on private route tables (cross-VPC traffic for BIRD)
resource "aws_route" "tgw_global_route_vpc1_private" {
  route_table_id         = aws_route_table.vpc1_private.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.ixp.id
}

resource "aws_route" "tgw_global_route_vpc2_private" {
  route_table_id         = aws_route_table.vpc2_private.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.ixp.id
}

resource "aws_route" "tgw_global_route_vpc3_private" {
  route_table_id         = aws_route_table.vpc3_private.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.ixp.id
}

# Private subnet route table associations
resource "aws_route_table_association" "vpc1_private" {
  subnet_id      = aws_subnet.vpc1_private.id
  route_table_id = aws_route_table.vpc1_private.id
}

resource "aws_route_table_association" "vpc2_private" {
  subnet_id      = aws_subnet.vpc2_private.id
  route_table_id = aws_route_table.vpc2_private.id
}

resource "aws_route_table_association" "vpc3_private" {
  subnet_id      = aws_subnet.vpc3_private.id
  route_table_id = aws_route_table.vpc3_private.id
}
