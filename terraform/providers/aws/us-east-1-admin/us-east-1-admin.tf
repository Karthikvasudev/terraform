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

variable "cluster-name"                     { }
variable "ami-id"                           { }
variable "instance-type"                    { }
variable "keypair-name"                     { }
variable "user-data-file"                   { }
variable "vpc-id"                           { }
variable "subnet-ids"                       { }
variable "azs"                              { }
variable "max-size"                         { }
variable "min-size"                         { }
variable "desired-capacity"                 { }


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

module "ecs" {
    source = "../../../modules/aws/ecs"

    cluster-name  = "${var.cluster-name}"
    
    # EC2 instance in the Cluster
    ami-id         = "${var.ami-id}"
    instance-type  = "${var.instance-type}"
    keypair-name   = "${var.keypair-name}"
    user-data-file = "${var.user-data-file}"

    vpc-id         = "${var.vpc-id}"
    subnet-ids     = "${var.subnet-ids}"
    azs            = "${var.azs}"

    # Auto-scaling group parameters
    max-size         = "${var.max-size}"
    min-size         = "${var.min-size}"
    desired-capacity = "${var.desired-capacity}"

}