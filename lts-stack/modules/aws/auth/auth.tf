/*
 * TF module to create user authenication resources
 */

 # Variables

variable "vpc_id"                   { }
variable "private_subnet_ids"       { }
variable "ldap_name"				{ }
variable "ldap_password"			{ }

variable "mfa_system_name" {
	type = "string"
	description = "name of the mfa system - freeradius"
	default = "freeradius"
}

variable "mfa_system_sg_ssh_allow_cidrs" {
	type = "string"
	description = "cidr blocks of public subnets"
}

variable "mfa_system_ami_id" {
	type = "string"
	description = "freeradius system mfa_system_ami_id"
	default = "ami-fce3c696" # us-east-1 region
}

variable "mfa_system_ec2_type" {
	type = "string"
	description = "freeradius ec2 instance type"
	default =  "t2.small"
}

variable "mfa_system_ec2_subnet_id" {
	type = "string"
	description = "subnet id where freeradius to be created"
}

variable "mfa_system_ec2_keypair" {
	type = "string"
	description = "keypair to be used for freeradius instance"
}

variable "mfa_system_ec2_userdata" {
	description = "user data file to configure the mfa system"
}

variable "region"  { }
variable "profile" { }

module "ldap" {
	source = "./ldap"

	ldap_name		    = "${var.ldap_name}"
	ldap_password		= "${var.ldap_password}"

	vpc_id				= "${var.vpc_id}"
	private_subnet_ids  = "${var.private_subnet_ids}"
}

module "mfa" {
	source = "./mfa"

	mfa_system_name = "${var.mfa_system_name}"
	vpc_id			= "${var.vpc_id}"
	mfa_system_sg_ssh_allow_cidrs = "${var.mfa_system_sg_ssh_allow_cidrs}"
	ad_connector_dns         = "${module.ldap.ad_service_connector_url}"
	ad_connector_ips         = "${module.ldap.ad_service_connector_ips}"
	mfa_system_ami_id        = "${var.mfa_system_ami_id}"
	mfa_system_ec2_type      = "${var.mfa_system_ec2_type}"
	mfa_system_ec2_subnet_id = "${var.mfa_system_ec2_subnet_id}"
	mfa_system_ec2_keypair   = "${var.mfa_system_ec2_keypair}"
	mfa_system_ec2_userdata  = "${var.mfa_system_ec2_userdata}"

	ad_service_connector_id  = "${module.ldap.ad_service_connector_id}"
	region = "${var.region}"
	profile = "${var.profile}"
}