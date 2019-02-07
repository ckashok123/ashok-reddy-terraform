#VPC Creation
resource "aws_vpc" "myvpc" {
  cidr_block       = "172.20.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "DLG"
  }
}
#Public Subnet Creation
resource "aws_subnet" "public-subnet" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "172.20.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Public Subnet"
  }
}
#Private Subnet1 Creation
resource "aws_subnet" "private-subnet1" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "172.20.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private Subnet1"
  }
}
#Private Subnet2 Creation
resource "aws_subnet" "private-subnet2" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "172.20.2.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "Private Subnet2"
  }
}
#Private Subnet3 Creation
resource "aws_subnet" "private-subnet3" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "172.20.3.0/24"
  availability_zone = "us-east-1d"
  tags = {
    Name = "Private Subnet3"
  }
}
#Private Subnet4 Creation
resource "aws_subnet" "private-subnet4" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "172.20.4.0/24"
  availability_zone = "us-east-1e"
  tags = {
    Name = "Private Subnet4"
  }
}
#Internet Gateway Creation
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.myvpc.id}"
  tags = {
    Name = "DLG-IGW"
  }
}
#Elastic Ip Creation
resource "aws_eip" "nat" {
    vpc      = true
}
#NAT Gateway Creation
resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public-subnet.id}"
  depends_on = ["aws_internet_gateway.gw"]
}
#Public Route Table Creation
resource "aws_route_table" "publicrt" {
  vpc_id = "${aws_vpc.myvpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "PublicRT"
  }
}
#Private Route Table Creation
resource "aws_route_table" "privatert" {
  vpc_id = "${aws_vpc.myvpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.gw.id}"
  }
  tags = {
    Name = "PrivateRT"
  }
}
#Public Route Table Association
resource "aws_route_table_association" "public-association" {
  subnet_id      = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.publicrt.id}"
}
#Private Route Table Associations
resource "aws_route_table_association" "private1-association" {
  subnet_id      = "${aws_subnet.private-subnet1.id}"
  route_table_id = "${aws_route_table.privatert.id}"
}
resource "aws_route_table_association" "private2-association" {
  subnet_id      = "${aws_subnet.private-subnet2.id}"
  route_table_id = "${aws_route_table.privatert.id}"
}
resource "aws_route_table_association" "private3-association" {
  subnet_id      = "${aws_subnet.private-subnet3.id}"
  route_table_id = "${aws_route_table.privatert.id}"
}
resource "aws_route_table_association" "private4-association" {
  subnet_id      = "${aws_subnet.private-subnet4.id}"
  route_table_id = "${aws_route_table.privatert.id}"
}
