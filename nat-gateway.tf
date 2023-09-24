
# Create NAT Gateway
resource "aws_nat_gateway" "bytewave_nat_gateway" {
  allocation_id = aws_eip.bytewave_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags = {
    Name = "ByteWave NAT Gateway"
  }
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "bytewave_eip" {}
