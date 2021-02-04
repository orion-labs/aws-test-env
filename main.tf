# The VPC
resource "aws_vpc" "testvpc" {
  cidr_block = var.vpc_network

  enable_dns_hostnames = true
  enable_dns_support = true


  tags = {
    Name = var.vpc_name
  }
}

# internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.testvpc.id

  tags = {
    Name = "main"
  }
}

# route tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id

  }

  tags = {
    Name = "main"

  }
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.public1.id

  }

  tags = {
    Name = "main"

  }
}

resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.public2.id

  }

  tags = {
    Name = "main"

  }
}

resource aws_route_table_association "pr1" {
  subnet_id = aws_subnet.private1.id
  route_table_id = aws_route_table.private1.id
}

resource aws_route_table_association "pr2" {
  subnet_id = aws_subnet.private2.id
  route_table_id = aws_route_table.private1.id
}


resource aws_route_table_association "pu1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource aws_route_table_association "pu2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

# subnets
resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = var.public_subnet_1_az

  tags = {
    Name = "OrionTest Public 1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = var.public_subnet_2_az

  tags = {
    Name = "OrionTest Public 2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = var.private_subnet_1_az

  tags = {
    Name = "OrionTest Private 1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = var.private_subnet_2_az

  tags = {
    Name = "OrionTest Private 2"
  }
}

# Elastic IP's
resource "aws_eip" "nat1" {
  vpc = true
}

resource "aws_eip" "nat2" {
  vpc = true
}

# NAT Gateways
resource "aws_nat_gateway" "public1" {
  allocation_id = aws_eip.nat1.id
  subnet_id = aws_subnet.public1.id
}

resource "aws_nat_gateway" "public2" {
  allocation_id = aws_eip.nat2.id
  subnet_id = aws_subnet.public2.id
}
