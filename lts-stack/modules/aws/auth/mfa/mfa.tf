/*
 * TF module to enable MFA using mfa_system
 */

# Variables

variable "mfa_system_name" {
	type = "string"
	description = "name of the mfa system - mfa_system"
	default = "mfa_system"
}

variable "vpc_id" {
	type = "string"
	description = "vpc id"
}

variable "mfa_system_sg_ssh_allow_cidrs" {
	type = "string"
	description = "cidr blocks of public subnets"
}

variable "ad_connector_dns" {
	description = "ad connector dns name"
}

variable "ad_connector_ips" {
	description = "ad connector dns ip addresses"
}

variable "mfa_system_ami_id" {
	type = "string"
	description = "mfa_system system mfa_system_ami_id"
	default = "ami-fce3c696" # us-east-1 region
}

variable "mfa_system_ec2_type" {
	type = "string"
	description = "mfa_system ec2 instance type"
	default =  "t2.small"
}

variable "mfa_system_ec2_subnet_id" {
	type = "string"
	description = "subnet id where mfa_system to be created"
}

variable "mfa_system_ec2_keypair" {
	type = "string"
	description = "keypair to be used for mfa_system instance"
}

variable "mfa_system_ec2_userdata" {
	description = "user data file to configure the mfa system"
}

variable "ad_service_connector_id" {
	type = "string"
	description = "AD connector ID"
}

variable "profile" { }
variable "region"  { }

# Resources

resource "aws_security_group" "mfa_system_sg" {
	name = "${var.mfa_system_name}-sg"

	vpc_id = "${var.vpc_id}"
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["${split(",", var.mfa_system_sg_ssh_allow_cidrs)}"]
	}

	ingress {
		from_port   = 1812
		to_port     = 1814
		protocol    = "udp"
		cidr_blocks = ["${element(split(",", var.ad_connector_ips),0)}/32","${element(split(",", var.ad_connector_ips),1)}/32"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "template_file" "user_data_tpl" {
	template = "${file(var.mfa_system_ec2_userdata)}"

	vars {
		AD_CONNECTOR_IP1 = "${element(split(",", var.ad_connector_ips), 0)}"
		AD_CONNECTOR_IP2 = "${element(split(",", var.ad_connector_ips), 1)}"
		AD_CONNECTOR_DNS = "${var.ad_connector_dns}"
	}
}

resource "aws_instance" "mfa_instance" {
	ami             = "${var.mfa_system_ami_id}"
	instance_type   = "${var.mfa_system_ec2_type}"
	subnet_id       = "${var.mfa_system_ec2_subnet_id}"
	security_groups = ["${aws_security_group.mfa_system_sg.id}"]
	key_name        = "${var.mfa_system_ec2_keypair}"
	
	user_data       = "${template_file.user_data_tpl.rendered}"

	tags {
		Name = "${var.mfa_system_name}"
	}

	provisioner "local-exec" {
		command = "sleep 3m && aws --region ${var.region} --profile ${var.profile} ds enable-radius --directory-id ${var.ad_service_connector_id} --radius-settings RadiusServers=${aws_instance.mfa_instance.private_ip},RadiusPort=1812,RadiusTimeout=20,RadiusRetries=10,SharedSecret=testing123,AuthenticationProtocol=PAP,DisplayLabel=Radius"
	}
}

# Outputs