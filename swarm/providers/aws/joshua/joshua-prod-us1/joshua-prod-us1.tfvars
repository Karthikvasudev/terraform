# Variables
	
region    = "us-east-1"
accountno = "661072482170"
env       = "joshua-prod-us1"

# VPC
existing_vpc_id = "vpc-3517bf51"
vpc_count       = 0
vpc_tag_name   = "aip-dev"
vpc_cidr_block = ""
existing_igw_id = "igw-c4565fa1"

public_subnet_cidrs = "10.85.12.0/27,10.85.12.32/27,10.85.12.64/27"
public_subnet_azs   = "us-east-1a,us-east-1b,us-east-1e"
private_subnet_cidrs = "10.85.12.160/27,10.85.12.192/27,10.85.12.224/27"
private_subnet_azs   = "us-east-1a,us-east-1b,us-east-1e"

node_ami_id = "ami-2051294a"
node_ec2_keypair = "aip-bi-dev-keys"
node_sec_group_ingress_cidrs = "10.0.0.0/8"