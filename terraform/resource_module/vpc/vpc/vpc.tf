resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.dns_hostname
  enable_dns_support = var.dns_support

  tags = {
    Name = "VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "TerraformIg"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet_numbers
  vpc_id = aws_vpc.vpc.id
  availability_zone = each.key
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
  tags = {
    "Name" = "terraform-${var.infra_env}-public-subnet"
    "Role" = "public"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet_numbers
  vpc_id = aws_vpc.vpc.id
  availability_zone = each.key
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
  tags = {
    "Name" = "terraform-${var.infra_env}-private-subnet"
    "Role" = "private"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Private-Route"
  }
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-Route"
  }
}

resource "aws_route_table_association" "private_route" {
  for_each       = var.private_subnet_numbers
  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "public_route" {
  for_each       = var.public_subnet_numbers
  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public_route.id
}