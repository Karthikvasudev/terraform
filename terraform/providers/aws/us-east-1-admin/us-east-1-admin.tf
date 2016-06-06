# N. Virginia us-east-1 Admin VPC

variable "region" 	{ default = "us-east-1" }
variable "profile" 	{ default = "default" }

provider "aws" {
    profile = "${var.profile}"
	region = "${var.region}"
}

# Variables

variable "adm_vpc_id"                       { }
variable "adm_vpc_az1"                      { }
variable "adm_vpc_az2"                      { }
variable "adm_vpc_private_route_table_id"   { }
variable "adm_vpc_ecs_subnet_az1_cidr"      { }
variable "adm_vpc_ecs_subnet_az2_cidr"      { }



module "vpc" {

	source = "../../../modules/aws/vpc"

	# Admin VPC Id
	adm_vpc_id = "${var.adm_vpc_id}"

	# CIDR block assignments
	adm_vpc_ecs_subnet_az1_cidr = "${var.adm_vpc_ecs_subnet_az1_cidr}"
	adm_vpc_ecs_subnet_az2_cidr = "${var.adm_vpc_ecs_subnet_az2_cidr}"

	# Subnet AZ assignments
	adm_vpc_az1 = "${var.adm_vpc_az1}"
	adm_vpc_az2 = "${var.adm_vpc_az2}"

	# Admin VPC Route Table Id
	adm_vpc_private_route_table_id = "${var.adm_vpc_private_route_table_id}"

}




