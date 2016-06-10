# N. Virginia us-east-1 Admin VPC

variable "region" 	{ }
variable "profile" 	{ default = "default" }

provider "aws" {
	profile = "${var.profile}"
	region  = "${var.region}"
}

# Variables

variable "adm_vpc_id"                        { }
variable "adm_vpc_az1"                       { }
variable "adm_vpc_az2"                       { }
variable "adm_vpc_private_route_table_id"    { }
variable "adm_vpc_ecs_subnet_az1_cidr"       { }
variable "adm_vpc_ecs_subnet_az2_cidr"       { }
variable "adm_vpc_nat_sg"                    { }

variable "adm_test_elb_name"                        { }
variable "adm_elb_test_listener_instance_port"      { }
variable "adm_elb_test_listener_instance_protocol"  { }
variable "adm_elb_test_listener_lb_port"            { }
variable "adm_elb_test_listener_lb_protocol"        { }
variable "adm_elb_test_elb_ssl_cert_arn"            { }
variable "adm_elb_test_elb_healthy_threshold"       { }
variable "adm_elb_test_elb_unhealthy_threshold"     { }
variable "adm_elb_test_elb_health_check_timeout"    { }
variable "adm_elb_test_elb_health_check_url"        { }
variable "adm_elb_test_elb_health_check_interval"   { }

variable "adm_ecs_cluster_name"              { }
variable "adm_ecs_cluster_ami_id"            { }
variable "adm_ecs_cluster_instance_type"     { }
variable "adm_ecs_cluster_ec2_keypair"       { }
variable "adm_ecs_cluster_ec2_userdata"      { }
variable "adm_ecs_cluster_autoscale_max"     { }
variable "adm_ecs_cluster_autoscale_min"     { }
variable "adm_ecs_cluster_autoscale_desired" { }
 
variable "adm_ecs_service_ecs_service_name"           { }
variable "adm_ecs_service_task_definition_file"       { }
variable "adm_ecs_service_ecs_task_name"              { }
variable "adm_ecs_service_ecs_service_desired_count"  { }

module "vpc" {

	source = "../../../modules/aws/network/vpc"

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

module "elb" {
	source = "../../../modules/aws/elb"

	elb_name   = "${var.adm_test_elb_name}"

	vpc_id     = "${var.adm_vpc_id}"
	subnet_ids = "${module.vpc.subnet_ids}"

	listener_instance_port     = "${var.adm_elb_test_listener_instance_port}"
	listener_instance_protocol = "${var.adm_elb_test_listener_instance_protocol}"
	listener_lb_port           = "${var.adm_elb_test_listener_lb_port}"
	listener_lb_protocol       = "${var.adm_elb_test_listener_lb_protocol}"

	elb_ssl_cert_arn          = "${var.adm_elb_test_elb_ssl_cert_arn}"

	elb_healthy_threshold     = "${var.adm_elb_test_elb_healthy_threshold}"
	elb_unhealthy_threshold   = "${var.adm_elb_test_elb_unhealthy_threshold}"
	elb_health_check_timeout  = "${var.adm_elb_test_elb_health_check_timeout}"
	elb_health_check_url      = "${var.adm_elb_test_elb_health_check_url}"
	elb_health_check_interval = "${var.adm_elb_test_elb_health_check_interval}"

}

module "ecs" {
	source = "../../../modules/aws/ecs"

	cluster_name  = "${var.adm_ecs_cluster_name}"
	
	# EC2 instance in the Cluster
	ami_id         = "${var.adm_ecs_cluster_ami_id}"
	instance_type  = "${var.adm_ecs_cluster_instance_type}"
	keypair_name   = "${var.adm_ecs_cluster_ec2_keypair}"
	user_data_file = "${var.adm_ecs_cluster_ec2_userdata}"

	vpc_id         = "${var.adm_vpc_id}"
	subnet_ids     = "${module.vpc.subnet_ids}"
	azs            = "${var.adm_vpc_az1},${var.adm_vpc_az2}"

	# Auto-scaling group parameters
	as_max_size         = "${var.adm_ecs_cluster_autoscale_max}"
	as_min_size         = "${var.adm_ecs_cluster_autoscale_min}"
	as_desired_capacity = "${var.adm_ecs_cluster_autoscale_desired}"
	elbs                = "${module.elb.elb_id}"

	# VPC nat instance Security Group id
	vpc_nat_instance_sg = "${var.adm_vpc_nat_sg}"
	
}

module "test_ecs_service" {
	source = "../../../modules/aws/ecs-service"

	ecs_service_name     = "${var.adm_ecs_service_ecs_service_name}"

	task_definition_file = "${var.adm_ecs_service_task_definition_file}"
	ecs_task_name        = "${var.adm_ecs_service_ecs_task_name}"

	ecs_cluser_id        = "${module.ecs.cluster_id}"

	ecs_service_desired_count = "${var.adm_ecs_service_ecs_service_desired_count}"

	#ecs_service_elb_name
	#ecs_service_container_name" 
	#ecs_service_container_port" 

}