# Create VPC for ByteWave Technologies
resource "aws_vpc" "bytewave_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ByteWave VPC"
  }
}