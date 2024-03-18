provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_vpc" "project04-vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "project04-vpc"
    }
}
// subnet 생성
// ap-northeast-2a
// public
resource "aws_subnet" "project04-subnet-public1-2a" {
    vpc_id = aws_vpc.project04-vpc.id
    cidr_block = var.public_subnet[0]
    availability_zone = var.azs[0]
    tags = {
        Name = "project04-subnet-public1-2a"
    }
}
// private
resource "aws_subnet" "project04-subnet-private1-2a" {
    vpc_id = aws_vpc.project04-vpc.id
    cidr_block = var.private_subnet[0]
    availability_zone = var.azs[0]
    tags = {
        Name = "project04-subnet-private1-2a"
    }
}
// ap-northeast-2c
// public
resource "aws_subnet" "project04-subnet-public2-2c" {
    vpc_id = aws_vpc.project04-vpc.id
    cidr_block = var.public_subnet[1]
    availability_zone = var.azs[1]
    tags = {
        Name = "project04-subnet-public2-2c"
    }
}

// private
resource "aws_subnet" "project04-subnet-private2-2c" {
    vpc_id = aws_vpc.project04-vpc.id
    cidr_block = var.private_subnet[1]
    availability_zone = var.azs[1]
    tags = {
        Name = "project04-subnet-private2-2c"
    }
}

// GATE WAY
resource "aws_internet_gateway" "project04-igw" {
  vpc_id = aws_vpc.project04-vpc.id

  tags = {
    Name = "project04-igw"
  }
}

// EIP
resource "aws_eip" "project04-eip" {
    domain = "vpc"
    depends_on = [ "aws_internet_gateway.project04-igw" ]
    lifecycle {
      create_before_destroy = true
    }
    tags = {
        Name = "project04-eip"
    }
}

// NAT GATE WAY
resource "aws_nat_gateway" "project04-nat-public1-2a" {
    allocation_id = aws_eip.project04-eip.id
    subnet_id = aws_subnet.project04-subnet-public1-2a.id
    depends_on = ["aws_internet_gateway.project04-igw"]

    tags = {
        Name = "project04-nat-public1-2a"
    }
}

// ROUTER
## public route table
resource "aws_default_route_table" "project04-public-rt-table" {
    default_route_table_id = aws_vpc.project04-vpc.default_route_table_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.project04-igw.id
    }
    tags = {
        Name = "project04-public-rt-table"
    }
}

resource "aws_route_table_association" "project04-public-rt-2a" {
    subnet_id = aws_subnet.project04-subnet-public1-2a.id
    route_table_id = aws_default_route_table.project04-public-rt-table.id
}

resource "aws_route_table_association" "project04-public-rt-2c" {
    subnet_id = aws_subnet.project04-subnet-public2-2c.id
    route_table_id = aws_default_route_table.project04-public-rt-table.id
}

## private route table
resource "aws_route_table" "project04-private-rt-table" {
    vpc_id = aws_vpc.project04-vpc.id
    tags = {
        Name = "project04-private-rt-table"
    }
}

## private route
resource "aws_route" "project04-private-rt" {
    route_table_id = aws_route_table.project04-private-rt-table.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.project04-nat-public1-2a.id
}

resource "aws_route_table_association" "project04-private-rt-2a" {
    subnet_id = aws_subnet.project04-subnet-private1-2a.id
    route_table_id = aws_route_table.project04-private-rt-table.id
}

resource "aws_route_table_association" "project04-private-rt-2c" {
    subnet_id = aws_subnet.project04-subnet-private2-2c.id
    route_table_id = aws_route_table.project04-private-rt-table.id
}