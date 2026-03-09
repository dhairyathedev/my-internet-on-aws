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
  availability_zone = var.region

  tags = {
    Name       = "vpc1_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc1_private" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = var.region

  tags = {
    Name       = "vpc1_private"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc2_public" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = var.region

  tags = {
    Name       = "vpc2_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc2_private" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.2.2.0/24"
  availability_zone = var.region

  tags = {
    Name       = "vpc2_private"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc3_public" {
  vpc_id            = aws_vpc.vpc3.id
  cidr_block        = "10.3.1.0/24"
  availability_zone = var.region

  tags = {
    Name       = "vpc3_public"
    Project    = "My Internet on AWS"
    CreatedVia = var.created_via
  }
}

resource "aws_subnet" "vpc3_private" {
  vpc_id            = aws_vpc.vpc3.id
  cidr_block        = "10.3.2.0/24"
  availability_zone = var.region

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
