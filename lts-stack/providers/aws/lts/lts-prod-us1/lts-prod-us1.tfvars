# Variables
	
region    = "us-east-1"
accountno = "488832870725"
env       = "lts-prod-us1"

# VPC
vpc_tag_name   = "lts-prod"
vpc_cidr_block = "10.85.96.0/24"

public_subnet_cidrs = "10.85.96.0/26,10.85.96.64/26"
public_subnet_azs   = "us-east-1a,us-east-1c"
private_subnet_cidrs = "10.85.96.128/26,10.85.96.192/26"
private_subnet_azs   = "us-east-1a,us-east-1c"

# LDAP
ldap_name 		= "aip-lts-ad-prod.aipadmin.com"
ldap_password	= "ConwayPark-CP01"

# MFA
mfa_system_ami_id       = "ami-fce3c696"
mfa_system_ec2_type     = "t2.small"
mfa_system_ec2_keypair  = "aip-lts-prod-keys"
mfa_system_ec2_userdata = "./lts/lts-prod-us1/freeradius-user-data.txt"

# PowerBI
powerbi_wst_ami      = "ami-6242fa75"
powerbi_wst_ec2_type = "m4.2xlarge"
powerbi_wst_keypair  = "aip-lts-prod-keys"