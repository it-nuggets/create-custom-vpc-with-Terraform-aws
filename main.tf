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
    Name = "it_nuggets_private_subnet_2"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.it-nuggets-vpc.id
  tags = {
    Name = "IGW"
  }
}

resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.it-nuggets-vpc.id


  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = "Pulic_RT"
  }
}


resource "aws_route_table_association" "public_subnet_1" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_RT.id
  
}

resource "aws_route_table_association" "it_nuggets_private_subnet_2" {
  subnet_id = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_RT.id
}