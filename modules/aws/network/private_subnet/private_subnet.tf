/*
 * TF module to create resources needed for a private subnet
 */

# Variables

variable "private_subnet_name" {
	description = "name of the subnet"
	default = "stack-private-subnet"
}

variable "vpc_id" {
	description = "vpc id where subnet to be created"
}

variable "private_subnet_cidrs" {
	description = "cidr blocks for the private subnets"
}

variable "private_subnet_azs" {
	description = "availability zones for the private subnets"
}

variable "nat_gateway_ids" {
	description = "nat gateway ids"
}

# Resources

resource "aws_subnet" "private_subnet" {
	vpc_id            = "${var.vpc_id}"
	cidr_block        = "${element(split(",", var.private_subnet_cidrs), count.index)}"
	availability_zone = "${element(split(",", var.private_subnet_azs), count.index)}"
	count             = "${length(split(",", var.private_subnet_cidrs))}"

	tags {
		Name = "${var.private_subnet_name}.${element(split(",", var.private_subnet_azs), count.index)}"
	}
}

resource "aws_route_table" "prvate_rtb" {
	vpc_id = "${var.vpc_id}"
	count  = "${length(split(",", var.private_subnet_cidrs))}"

	route {
		cidr_block     = "0.0.0.0/0"
		nat_gateway_id = "${element(split(",", var.nat_gateway_ids), count.index)}"
	}

	tags {
		Name = "${var.private_subnet_name}.${element(split(",", var.private_subnet_azs), count.index)}"
	}
}

resource "aws_route_table_association" "prvate_rtb_association" {
	count          = "${length(split(",", var.private_subnet_cidrs))}"
	subnet_id      = "${element(aws_subnet.private_subnet.*.id, count.index)}"
	route_table_id = "${element(aws_route_table.prvate_rtb.*.id, count.index)}"
}

# Outputs

output "subnet_ids" { value = "${join(",", aws_subnet.private_subnet.*.id)}" }