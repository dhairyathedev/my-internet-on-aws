resource "aws_ec2_transit_gateway" "ixp" {
  description = "IXP Transit Gateway"

  tags = {
    Name       = "ixp"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1" {
  subnet_ids         = [aws_subnet.vpc1_private.id]
  vpc_id             = aws_vpc.vpc1.id
  transit_gateway_id = aws_ec2_transit_gateway.ixp.id

  tags = {
    Name       = "vpc1"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2" {
  subnet_ids         = [aws_subnet.vpc2_private.id]
  vpc_id             = aws_vpc.vpc2.id
  transit_gateway_id = aws_ec2_transit_gateway.ixp.id

  tags = {
    Name       = "vpc2"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc3" {
  subnet_ids         = [aws_subnet.vpc3_private.id]
  vpc_id             = aws_vpc.vpc3.id
  transit_gateway_id = aws_ec2_transit_gateway.ixp.id

  tags = {
    Name       = "vpc3"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}


# Route table
resource "aws_ec2_transit_gateway_route_table" "tgw_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.ixp.id

  tags = {
    Name       = "tgw_route_table"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_route_table.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_route_table.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc3" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc3.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_route_table.id
}
