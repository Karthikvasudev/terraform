# Variables
	
region    = "us-east-1"
accountno = "596978647277"
env       = "joshua-infradev-us1"

# VPC
existing_vpc_id = "vpc-f7872b93"
vpc_count       = 0
vpc_tag_name   = "joshua"
vpc_cidr_block = ""
existing_igw_id = "igw-7a98941f"

public_subnet_cidrs = "10.85.12.0/27,10.85.12.32/27,10.85.12.64/27"
public_subnet_azs   = "us-east-1c,us-east-1d,us-east-1e"
private_subnet_cidrs = "10.85.12.96/28,10.85.12.112/28,10.85.12.128/28,10.85.12.160/27,10.85.12.192/27,10.85.12.224/27"
private_subnet_azs   = "us-east-1c,us-east-1d,us-east-1e,us-east-1c,us-east-1d,us-east-1e"

node_ami_id = "ami-2051294a"
node_ec2_keypair = "aip-bi-adm-keys-infradev"
node_reg_secret_token = "Joshua123"
node_sec_group_ingress_cidrs = "10.0.0.0/8"