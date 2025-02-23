# Create 3 VPCs
# VPC-A-Virginia-Prod 10.80.0.0/16
# VPC-B-Virginia-Dev 10.81.0.0/16
# VPC-C-Virginia-Test 10.82.0.0/16

variable "vpcs" {
    type = map(map(string))
    default = {
        VPC-A-Virginia-Prod = {
            cidr = "10.80.0.0/16"
            service = "Production"
        }
        VPC-B-Virginia-Dev = {
            cidr = "10.81.0.0/16"
            service = "Development"
        }
        VPC-C-Virginia-Test = {
            cidr = "10.82.0.0/16"
            service = "Testing"
        }
    }
}


variable "subnets" {
    type = map(map(string))
    default = {
        VPC-A-Virginia-Prod-pub = {
            cidr = "10.80.1.0/24"
            vpc = "VPC-A-Virginia-Prod"
            az = "us-east-1a"
            service = "production"
        }
        VPC-A-Virginia-Prod-priv = {
            cidr = "10.80.11.0/24"
            vpc = "VPC-A-Virginia-Prod"
            az = "us-east-1a"
            service = "prod"
        }
        VPC-B-Virginia-Dev-priv = {
            cidr = "10.81.12.0/24"
            vpc = "VPC-B-Virginia-Dev"
            az = "us-east-1b"
            service = "development"
        }
        VPC-C-Virginia-Test-priv = {
            cidr = "10.82.13.0/24"
            vpc = "VPC-C-Virginia-Test"
            az = "us-east-1c"
            service = "testing"
        }
    }
}

variable "prod-igw" {
    type = string
    default = "VPC-A-Virginia-Prod"
}