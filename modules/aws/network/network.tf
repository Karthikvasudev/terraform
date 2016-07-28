
/* 
 * TF module to to create network infrastructure for the stack
 */

# Variables

/*
 # VPC
*/
variable "vpc_tag_name" {
	description = "tag name of the vpc"
	default = "vpc"
}

variable "existing_vpc_id" {
	description = "id of existing vpc"
}

variable "vpc_count" {
	type = "string"
	description = "number of vpcs"
}

variable "vpc_cidr_block" {
	description = "the cidr block for the VPC"
}

variable "vpc_instance_tenancy" {
	description = "tenancy option for instances launched into the VPC"
	default     = "default"
}

variable "existing_igw_id" {
	type = "string"
	description = "existing igw_id"
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

	existing_vpc_id = "${var.existing_vpc_id}"
	count           = "${var.vpc_count}"
	
	vpc_tag_name    = "${var.vpc_tag_name}-vpc"
	vpc_cidr_blocks = "${var.vpc_cidr_block}"
}

module "public_subnet" {
	source = "./public_subnet"

	public_subnet_name   = "${var.vpc_tag_name}-public-subnet"
	#vpc_id = "${module.vpc.vpc_ids}"
	#vpc_id  = "${element(concat(join(",", var.existing_vpc_id), join(",", module.vpc.vpc_ids)),0)}"
	vpc_id = "${var.existing_vpc_id}"
	existing_igw_id = "${var.existing_igw_id}"
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
	#vpc_id = "${module.vpc.vpc_ids}"
	#vpc_id  = "${element(split(",", concat(join(",", var.existing_vpc_id), join(",", module.vpc.vpc_ids))),0)}"
	#vpc_id  = "${element(concat(join(",", var.existing_vpc_id), join(",", module.vpc.vpc_ids)),0)}"
	vpc_id = "${var.existing_vpc_id}"
	private_subnet_cidrs  = "${var.private_subnet_cidrs}"
	private_subnet_azs    = "${var.private_subnet_azs}"

	nat_gateway_ids = "${module.nat.nat_gateway_ids}"
}

# Outputs

output "vpc_ids" { value = "${module.vpc.vpc_ids}" }
output "private_subnet_ids" { value = "${module.private_subnet.subnet_ids}" }
output "public_subnet_ids" { value = "${module.public_subnet.subnet_ids}" }