# TF configuration to create the Joshua app stack

variable "region" 	 { default = "us-east-1" }
variable "accountno" { }
variable "env"       { }

variable "profile" 	 { default = "infradev" }

provider "aws" {
	profile = "${var.profile}"
	region  = "${var.region}"
}

# stack Terraform State - Remote Storage Backend configuration
resource "terraform_remote_state" "s3-remote-state" {
	backend = "s3"
	config {
		bucket = "aip-config-${var.region}-${var.accountno}"
		key    = "terraform/${var.env}/${var.env}.tfstate"
		region = "${var.region}"
		profile = "${var.profile}"
	}
}

# Variables

variable "vpc_tag_name"            { }
variable "vpc_cidr_block"          { }
variable "public_subnet_cidrs"     { }
variable "public_subnet_azs"       { }
variable "private_subnet_cidrs"    { }
variable "private_subnet_azs"      { }
variable "existing_vpc_id"         { }
variable "vpc_count"               { }
variable "existing_igw_id"         { }

variable "node_ami_id"             { }
variable "node_ec2_keypair"        { }
variable "node_sec_group_ingress_cidrs"  { }


module "network" {

	source = "../../../../modules/aws/network"

	existing_vpc_id = "${var.existing_vpc_id}"
	vpc_count       = "${var.vpc_count}"
	existing_igw_id = "${var.existing_igw_id}"

	vpc_tag_name   = "${var.vpc_tag_name}"
	vpc_cidr_block = "${var.vpc_cidr_block}"

	# public subnet
	public_subnet_cidrs = "${var.public_subnet_cidrs}"
	public_subnet_azs   =  "${var.public_subnet_azs}"

	# private subnet
	private_subnet_cidrs = "${var.private_subnet_cidrs}"
	private_subnet_azs   = "${var.private_subnet_azs}"
}

module "cluster" {

	source = "../../../../modules/aws/cluster"

	vpc_id = "${var.existing_vpc_id}"

	cluster_name     = "${var.vpc_tag_name}"
	node_ami_id      = "${var.node_ami_id}"
	node_ec2_keypair = "${var.node_ec2_keypair}"

	node_asg_subnet_ids = "${module.network.private_subnet_ids}"
	node_asg_azs        = "${var.private_subnet_azs}"

	node_sec_group_ingress_cidrs = "${var.node_sec_group_ingress_cidrs}"
}
