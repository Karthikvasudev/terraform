/*
 * TF module to create a VPC
 */

# Variables

variable "vpc_tag_name" {
	description = "tag name of the vpc"
}

variable "vpc_cidr_block" {
	description = "the cidr block for the VPC"
}

variable "vpc_instance_tenancy" {
	description = "tenancy option for instances launched into the VPC"
	default = "default"
}

# Resources

/*
 * Creates vpc for the specified cidr block
 */
resource "aws_vpc" "lts_vpc" {
	cidr_block = "${var.vpc_cidr_block}"
	instance_tenancy = "${var.vpc_instance_tenancy}"

	enable_dns_support = true
	enable_dns_hostnames = true

	tags {
		Name = "${var.vpc_tag_name}"
	}
}

# Outputs

output "vpc_id" { value = "${aws_vpc.lts_vpc.id}" }