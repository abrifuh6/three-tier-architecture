# Associate the ELB security group with your ELBs
resource "aws_lb" "elb_internet_facing" {
  name               = "bytewave-internet-elb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  security_groups    = [aws_security_group.elb_security_group.id] # Associate the ELB security group
  # ...
}

# Create the internal ELB with the same security group
resource "aws_lb" "elb_internal" {
  name               = "bytewave-internal-elb"
  internal           = true
  load_balancer_type = "application"
  subnets            = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  security_groups    = [aws_security_group.elb_security_group.id] # Associate the ELB security group
  # ...
}
