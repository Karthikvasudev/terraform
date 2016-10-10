/*
 * TF module to create NAT gateway
 */

variable "public_subnet_ids" {
	description = "public subnet ids"
}

resource "aws_eip" "nat_eip" {
	vpc   = true
}

resource "aws_nat_gateway" "nat_gateway" {
	allocation_id = "${element(aws_eip.nat_eip.*.id, count.index)}"
	subnet_id     = "${element(split(",", var.public_subnet_ids), count.index)}"
}

output "nat_gateway_ids" { value = "${join(",", aws_nat_gateway.nat_gateway.*.id)}" }