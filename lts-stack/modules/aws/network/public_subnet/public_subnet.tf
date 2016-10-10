/*
 * TF module to create resources needed for a public subnet
 */

# Variables

variable "public_subnet_name" {
	description = "name of the subnet"
	default = "lts-public-subnet"
}

variable "vpc_id" {
	description = "vpc id where subnet to be created"
}

variable "public_subnet_cidrs" {
	description = "cidr blocks for the public subnets"
}

variable "public_subnet_azs" {
	description = "availability zones for the public subnets"
}

# Resources

resource "aws_internet_gateway" "lts-igw" {
	vpc_id = "${var.vpc_id}"

	tags {
		Name = "${var.public_subnet_name}-igw"
	}
}

resource "aws_subnet" "public_subnet" {
	vpc_id            = "${var.vpc_id}"
	cidr_block        = "${element(split(",", var.public_subnet_cidrs), count.index)}"
	availability_zone = "${element(split(",", var.public_subnet_azs), count.index)}"
	count             = "${length(split(",", var.public_subnet_cidrs))}"

	tags {
		Name = "${var.public_subnet_name}.${element(split(",", var.public_subnet_azs), count.index)}"
	}

	map_public_ip_on_launch = true
}

resource "aws_route_table" "public_rtb" {
	vpc_id = "${var.vpc_id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.lts-igw.id}"
	}

	tags {
		Name = "${var.public_subnet_name}.${element(split(",", var.public_subnet_azs), count.index)}"
	}
}

resource "aws_route_table_association" "public_rtb_associateion" {
	count          = "${length(split(",", var.public_subnet_cidrs))}"
	subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
	route_table_id = "${aws_route_table.public_rtb.id}"
}

# Outputs

output "subnet_ids" { value = "${join(",", aws_subnet.public_subnet.*.id)}" }