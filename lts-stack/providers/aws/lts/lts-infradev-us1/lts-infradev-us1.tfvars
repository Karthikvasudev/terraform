# Variables
	
region    = "us-east-1"
accountno = "596978647277"
env       = "lts-infradev-us1"

# VPC
vpc_tag_name   = "lts-infradev"
vpc_cidr_block = "10.85.96.0/24"

public_subnet_cidrs = "10.85.96.0/26,10.85.96.64/26"
public_subnet_azs   = "us-east-1d,us-east-1e"
private_subnet_cidrs = "10.85.96.128/26,10.85.96.192/26"
private_subnet_azs   = "us-east-1d,us-east-1e"

# LDAP
ldap_name 		= "aip-lts-ldap.aipadmin.com"
ldap_password	= "ConwayPark-CP01"

# MFA
mfa_system_ami_id       = "ami-fce3c696"
mfa_system_ec2_type     = "t2.small"
mfa_system_ec2_keypair  = "aip-bi-adm-keys-infradev"
mfa_system_ec2_userdata = "./lts/lts-infradev-us1/freeradius-user-data.txt"