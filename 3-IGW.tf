# Testing format using variables
resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.vpcs[var.prod-igw].id

  tags = {
    Name    = "${var.prod-igw}-igw"
    # Service = "app1"
    # Owner   = "Nick"
    # Planet  = "E-arth"
  }
}

