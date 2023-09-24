### Create Public Subnets  ###


resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.bytewave_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a" # Change this to your desired availability zone
  tags = {
    Name = "ByteWave Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.bytewave_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b" # Change this to your desired availability zone
  tags = {
    Name = "ByteWave Public Subnet 2"
  }
}

### Create Private Subnets ###  


resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.bytewave_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a" # Change this to your desired availability zone
  tags = {
    Name = "ByteWave Private Subnet 1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.bytewave_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b" # Change this to your desired availability zone
  tags = {
    Name = "ByteWave Private Subnet 2"
  }
}

# Create Database Private Subnets
resource "aws_subnet" "db_subnet_1" {
  vpc_id            = aws_vpc.bytewave_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1a" # Change this to your desired availability zone
  tags = {
    Name = "ByteWave Database Subnet 1"
  }
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id            = aws_vpc.bytewave_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1b" # Change this to your desired availability zone
  tags = {
    Name = "ByteWave Database Subnet 2"
  }
}