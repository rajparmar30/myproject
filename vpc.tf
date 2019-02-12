resource "aws_vpc" "my_vpc" {
  cidr_block = "10.60.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.60.0.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = "Web Public Subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.60.16.0/20"
  availability_zone = "us-east-1b"

  tags {
    Name = "Database Private Subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.my_vpc.id}"

  tags {
    Name = "VPC IGW"
  }
}

resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.my_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

resource "aws_route_table_association" "web-public-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}

resource "aws_eip" "terraformtraining-nat" {
vpc      = true
}
resource "aws_nat_gateway" "terraformtraining-nat-gw" {
allocation_id = "${aws_eip.terraformtraining-nat.id}"
subnet_id = "${aws_subnet.public-subnet.id}"
}

resource "aws_route_table" "terraformtraining-private" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.terraformtraining-nat-gw.id}"
    }

    tags {
        Name = "terraformtraining-private-1"
    }
}

resource "aws_route_table_association" "terraformtraining-private-1-a" {
    subnet_id = "${aws_subnet.private-subnet.id}"
    route_table_id = "${aws_route_table.terraformtraining-private.id}"
}
