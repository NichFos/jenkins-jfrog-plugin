# #These are   for  public

# resource "aws_subnet" "VPC-A-Ireland-pub" {
#   vpc_id                  = aws_vpc.VPC-A-Ireland-Prod.id
#   cidr_block              = "10.80.1.0/24"
#   availability_zone       = "eu-west-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name    = "VPC-A-Ireland-Prod-pub"
#     Service = "Prod"
#     Owner   = "Nick"
#     Planet  = "E-arth"
#   }
# }

# #these are for private
# resource "aws_subnet" "VPC-A-Ireland-Prod-priv" {
#   vpc_id            = aws_vpc.VPC-A-Ireland-Prod.id
#   cidr_block        = "10.80.11.0/24"
#   availability_zone = "eu-west-1a"

#   tags = {
#     Name    = "VPC-A-Ireland-Prod-priv"
#     Service = "Prod"
#     Owner   = "Nick"
#     Planet  = "E-arth"
#   }
# }

# resource "aws_subnet" "VPC-B-Ireland-Dev-priv" {
#   vpc_id            = aws_vpc.VPC-B-Ireland-Dev.id
#   cidr_block        = "10.81.12.0/24"
#   availability_zone = "eu-west-1b"

#   tags = {
#     Name    = "VPC-B-Ireland-Dev"
#     Service = "Dev"
#     Owner   = "Nick"
#     Planet  = "E-arth"
#   }
# }


# resource "aws_subnet" "VPC-C-Ireland-Test-priv" {
#   vpc_id            = aws_vpc.VPC-C-Ireland-Test.id
#   cidr_block        = "10.82.13.0/24"
#   availability_zone = "eu-west-1c"

#   tags = {
#     Name    = "VPC-C-Ireland-Test"
#     Service = "Test"
#     Owner   = "Nick"
#     Planet  = "E-arth"
#   }
# }




# Testing format using variables
resource "aws_subnet" "subnets" {
  for_each = var.subnets
  vpc_id = aws_vpc.vpcs[each.value.vpc].id
  cidr_block = each.value.cidr 
  availability_zone = each.value.az 
  map_public_ip_on_launch = true

  tags = {
    Name = each.key
    Service = each.value.service
  }
}