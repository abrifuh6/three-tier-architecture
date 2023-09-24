# Security Group for ELBs
resource "aws_security_group" "elb_security_group" {
  name_prefix   = "bytewave-elb-sg-"
  description   = "Security group for ELBs"
  vpc_id        = aws_vpc.bytewave_vpc.id
}

# Example: Allow incoming HTTP traffic to the ELB
resource "aws_security_group_rule" "elb_http_ingress" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb_security_group.id
}

# Example: Allow incoming HTTPS traffic to the ELB
resource "aws_security_group_rule" "elb_https_ingress" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb_security_group.id
}

# Associate the ELB security group with your ELBs
resource "aws_lb" "internet_facing_elb" {
  name               = "bytewave-internet-elb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  security_groups    = [aws_security_group.elb_security_group.id] # Associate the ELB security group
  # ...
}

# Create the internal ELB with the same security group
resource "aws_lb" "internal_elb" {
  name               = "bytewave-internal-elb"
  internal           = true
  load_balancer_type = "application"
  subnets            = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  security_groups    = [aws_security_group.elb_security_group.id] # Associate the ELB security group
  # ...
}