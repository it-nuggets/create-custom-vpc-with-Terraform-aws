resource "aws_vpc" "it-nuggets-vpc" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
      Name = "it-nuggets-vpc"
    }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.it-nuggets-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1
  tags = {
    Name = "it_nuggets_Public_Subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.it-nuggets-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2
  tags = {
    Name = "it_nuggets_Public_Subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.it-nuggets-vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1
  tags = {
    Name = "it_nuggets_private_subnet_1"
  }
}


resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.it-nuggets-vpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2
  tags = {
    Name = "private_subnet_2"
  }
}