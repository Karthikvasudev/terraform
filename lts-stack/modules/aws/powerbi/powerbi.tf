/*
 * TF module to create PowerBI workstation
 */

# Variables

variable "powerbi_wst_ami" {
 	type = "string"
 	description = "powerbi workstation ami-id"
}

variable "powerbi_wst_ec2_type" {
 	type = "string"
 	description = "powerbi workstation  ec2 instance type"
}

variable "powerbi_wst_ec2_subnet_id" {
	type = "string"
	description = "powerbi workstation's subnet id"
}

variable "powerbi_wst_keypair" {
	type = "string"
	description = "powerbi workstation's keypair"
}

variable "powerbi_wst_rdp_allow_cidr" {
 	type = "string"
 	description = "powerbi workstation's security group rdp ingress allow cidr block"
}

variable "vpc_id" { }

# Resources

resource "aws_security_group" "powerbi_wst_sg" {
	name = "powerbi_workstation-sg"

	vpc_id = "${var.vpc_id}"
	ingress {
		from_port   = 3389
		to_port     = 3389
		protocol    = "tcp"
		cidr_blocks = ["${var.powerbi_wst_rdp_allow_cidr}"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "powerbi_wst" {
	ami             = "${var.powerbi_wst_ami}"
	instance_type   = "${var.powerbi_wst_ec2_type}"
	subnet_id       = "${var.powerbi_wst_ec2_subnet_id}"
	security_groups = ["${aws_security_group.powerbi_wst_sg.id}"]
	key_name        = "${var.powerbi_wst_keypair}"

	tags {
		Name = "powerbi_workstation"
	}
}

# Outputs