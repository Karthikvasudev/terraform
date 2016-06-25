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