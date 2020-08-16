resource "aws_vpc" "tf_main_vpc" {
  cidr_block         = "10.0.0.0/16"
  instance_tenancy   = "default"
  enable_classiclink = "false"
  tags = {
    Name = "tf_main_vp"
  }
}

resource "aws_subnet" "tf_public_subnet" {
  vpc_id                  = aws_vpc.tf_main_vpc.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "tf_public_subnet"
  }
}

resource "aws_subnet" "tf_private_subnet_1a" {
  vpc_id                  = aws_vpc.tf_main_vpc.id
  cidr_block              = "10.0.20.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "tf_private_subnet_1a"
  }
}

resource "aws_subnet" "tf_private_subnet_1c" {
  vpc_id                  = aws_vpc.tf_main_vpc.id
  cidr_block              = "10.0.21.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-1c"

  tags = {
    Name = "tf_private_subnet_1c"
  }
}

resource "aws_internet_gateway" "tf_gw" {
  vpc_id = aws_vpc.tf_main_vpc.id

  tags = {
    Name = "tf_gw"
  }
}

resource "aws_route_table" "tf_rt" {
  vpc_id = aws_vpc.tf_main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.tf_public_subnet.id
  route_table_id = aws_route_table.tf_rt.id
}



