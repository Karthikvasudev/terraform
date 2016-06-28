/*
 * TF module to create resources for Simple Directory with MFA using AD Connector
 */

# Variables

variable "ldap_name" {
	description = "name of the Simple Directory"
	default     = "ldap.aipadmin.com"
}

variable "ldap_username" {
	description = "username for the Simple Directory, typically admin"
	default     = "Administrator"
}

variable "ldap_password" {
	description = "AWS Directory Service creates a directory administrator account with the user name Administrator and this password."
	default     = "ConwayPark-CP01"
}

variable "ldap_size" {
	description = "Small or Large"
	default     = "Small"
}


variable "vpc_id"             { }
variable "private_subnet_ids" { }



# Directory Service - Simple AD
resource "aws_directory_service_directory" "ldap" {
	name                = "${var.ldap_name}"
	password            = "${var.ldap_password}"
	size                = "${var.ldap_size}"
	description			= "Simple Directory Service"

	# VPC ID, Subnets
	vpc_settings {
	vpc_id              = "${var.vpc_id}"
	subnet_ids          = ["${split(",", var.private_subnet_ids)}"]
	}
}


# Directory Service Connector - Needed for MFA
resource "aws_directory_service_directory" "ldap-connector" {
	name				= "${var.ldap_name}"
	password            = "${var.ldap_password}"
	size                = "${var.ldap_size}"
	type                = "ADConnector"
	description			= "Directory Service AD Connector"
	alias				= "${element(split(".", var.ldap_name), 0)}" #must remove domain name due to AWS syntax.

	depends_on          = ["aws_directory_service_directory.ldap"]

	# Connection Settings
	connect_settings {
	customer_username   = "${var.ldap_username}"
	customer_dns_ips    = ["${aws_directory_service_directory.ldap.dns_ip_addresses}"]
	vpc_id              = "${var.vpc_id}"
	subnet_ids          = ["${split(",", var.private_subnet_ids)}"]
	}
}


output "ad_service_dns_joined" {
	value = "${join(",",aws_directory_service_directory.ldap.dns_ip_addresses)}"
}


output "ad_service_connector_joined" {
	value = "${join(",",aws_directory_service_directory.ldap-connector.dns_ip_addresses)}"
}
