#####################################
# private subnet
####################################

resource "aws_subnet" "aws-asg-private-sn" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = var.aws-priv-subnet-cidr
  availability_zone       = var.aws-priv-sn-az
  map_public_ip_on_launch = false
  tags                    = var.tags
}

#####################################
# elastic ip
####################################

resource "aws_eip" "nat_gateway" {
  vpc = true
}

#####################################
# nat gateway
####################################

resource "aws_nat_gateway" "demo-nat" {
  #subnet_id     = local.subnet_ids_list[0]
  subnet_id     = var.aws_nat_gw_public_sn
  allocation_id = aws_eip.nat_gateway.id
  tags          = var.tags
  connectivity_type = "public"

}

#####################################
# route table
####################################

resource "aws_route_table" "nat-route" {
  vpc_id = data.aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.demo-nat.id
  }
}

#####################################
# route table association
####################################

resource "aws_route_table_association" "instance" {
  subnet_id = aws_subnet.aws-asg-private-sn.id
  route_table_id = aws_route_table.nat-route.id
}
