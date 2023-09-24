

# Creating Route Tables for my different subnets

# Public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.bytewave_vpc.id
  tags = {
    Name = "ByteWave Public Route Table"
  }
}
# Add a route rule to send traffic to the Internet Gateway
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0" # Destination is the Internet
  gateway_id             = aws_internet_gateway.bytewave_igw.id
}


# Private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.bytewave_vpc.id
  tags = {
    Name = "ByteWave Private Route Table"
  }
}

# Add a route rule to send traffic to the NAT Gateway for Internet access
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0" # Destination is the Internet
  nat_gateway_id         = aws_nat_gateway.bytewave_nat_gateway.id
}

# Creating Route Table Associations for my subnets
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}