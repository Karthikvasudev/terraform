/*
 * TF module to create a VPC
 */

# Variables

variable "vpc_tag_name" {
	description = "tag name of the vpc"
}

variable "vpc_cidr_blocks" {
	description = "the cidr block for the VPC"
}

variable "vpc_instance_tenancy" {
	description = "tenancy option for instances launched into the VPC"
	default = "default"
}

variable "existing_vpc_id" {
	description = "id of existing vpc"
}

variable "count" {
	description = "number of vpcs"
	default=0
}

# Resources

/*
 * Creates vpc for the specified cidr block
 */
resource "aws_vpc" "stack_vpc" {
	#count      = "${length(split(",", var.vpc_cidr_blocks))}"
	count      = "${var.count}"
	cidr_block = "${element(split(",", var.vpc_cidr_blocks),count.index)}"

	instance_tenancy = "${var.vpc_instance_tenancy}"

	enable_dns_support = true
	enable_dns_hostnames = true

	tags {
		Name = "${var.vpc_tag_name}"
	}
}

# Outputs

output "vpc_ids" { value = "${join(",", aws_vpc.stack_vpc.*.id,var.existing_vpc_id)}" }