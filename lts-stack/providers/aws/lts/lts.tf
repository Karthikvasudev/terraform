# TF configuration to create the LTS stack

variable "region" 	 { default = "us-east-1" }
variable "accountno" { }
variable "env"       { }

variable "profile" 	 { default = "default" }

provider "aws" {
	profile = "${var.profile}"
	region  = "${var.region}"
}

# LTS Terraform State - Remote Storage Backend configuration
resource "terraform_remote_state" "s3-remote-state" {
	backend = "s3"
	config {
		bucket = "aip-config-${var.region}-${var.accountno}"
		key    = "terraform/${var.env}/${var.env}.tfstate"
		region = "${var.region}"
	}
}

# Variables

variable "vpc_tag_name"            { }
variable "vpc_cidr_block"          { }
variable "public_subnet_cidrs"     { }
variable "public_subnet_azs"       { }
variable "private_subnet_cidrs"    { }
variable "private_subnet_azs"      { }

module "network" {

	source = "../../../modules/aws/network"

	vpc_tag_name   = "${var.vpc_tag_name}"
	vpc_cidr_block = "${var.vpc_cidr_block}"

	# public subnet
	public_subnet_cidrs = "${var.public_subnet_cidrs}"
	public_subnet_azs   =  "${var.public_subnet_azs}"

	# private subnet
	private_subnet_cidrs = "${var.private_subnet_cidrs}"
	private_subnet_azs   = "${var.private_subnet_azs}"
}


variable "ldap_name"				{ }
variable "ldap_password"			{ }

variable "mfa_system_ami_id"        { }
variable "mfa_system_ec2_type" { }
variable "mfa_system_ec2_keypair" { }
variable "mfa_system_ec2_userdata" { }

module "auth" {
	source = "../../../modules/aws/auth"
	
	vpc_id = "${module.network.vpc_id}"
	private_subnet_ids = "${module.network.private_subnet_ids}"
	ldap_name = "${var.ldap_name}"
	ldap_password = "${var.ldap_password}"

	mfa_system_name = "lts-freeradius-${var.region}"
	mfa_system_sg_ssh_allow_cidrs = "${var.vpc_cidr_block}"
	mfa_system_ami_id = "${var.mfa_system_ami_id}"
	mfa_system_ec2_subnet_id = "${element(split(",",module.network.private_subnet_ids), 0)}"
	mfa_system_ec2_keypair = "${var.mfa_system_ec2_keypair}"
	mfa_system_ec2_userdata = "${var.mfa_system_ec2_userdata}"

	region  = "${var.region}"
	profile = "${var.profile}"
}