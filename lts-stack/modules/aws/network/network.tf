
/* 
 * TF module to to create network infrastructure for the LTS stack
 */

# Variables

/*
 # VPC
*/ 
variable "vpc_tag_name" {
	description = "tag name of the vpc"
	default = "lts-vpc"
}

variable "vpc_cidr_block" {
	description = "the cidr block for the VPC"
}

variable "vpc_instance_tenancy" {
	description = "tenancy option for instances launched into the VPC"
	default     = "default"
}

# public subnet

variable "public_subnet_cidrs" {
	description = "cidr blocks for the public subnets"
}

variable "public_subnet_azs" {
	description = "availability zones for the public subnets"
}

# private subnet

variable "private_subnet_cidrs" {
	description = "cidr blocks for the private subnets"
}

variable "private_subnet_azs" {
	description = "availability zones for the private subnets"
}

module "vpc" {
	source = "./vpc"

	vpc_tag_name   = "${var.vpc_tag_name}-vpc"
	vpc_cidr_block = "${var.vpc_cidr_block}"
}

module "public_subnet" {
	source = "./public_subnet"

	public_subnet_name   = "${var.vpc_tag_name}-public-subnet"
	vpc_id = "${module.vpc.vpc_id}"
	public_subnet_cidrs  = "${var.public_subnet_cidrs}"
	public_subnet_azs    = "${var.public_subnet_azs}"
}

module "nat" {
	source = "./nat"

	public_subnet_ids = "${module.public_subnet.subnet_ids}"
}

module "private_subnet" {
	source = "./private_subnet"

	private_subnet_name   = "${var.vpc_tag_name}-private-subnet"
	vpc_id = "${module.vpc.vpc_id}"
	private_subnet_cidrs  = "${var.private_subnet_cidrs}"
	private_subnet_azs    = "${var.private_subnet_azs}"

	nat_gateway_ids = "${module.nat.nat_gateway_ids}"
}