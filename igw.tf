# Create Internet Gateway for Bytewave
resource "aws_internet_gateway" "bytewave_igw" {
  vpc_id = aws_vpc.bytewave_vpc.id
  tags = {
    Name = "ByteWave Internet Gateway"
  }
}