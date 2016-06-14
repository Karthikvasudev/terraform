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

# ECS Cluster

variable "adm_ecs_cluster_name"              { }
variable "adm_ecs_cluster_ami_id"            { }
variable "adm_ecs_cluster_instance_type"     { }
variable "adm_ecs_cluster_ec2_keypair"       { }
variable "adm_ecs_cluster_ec2_userdata"      { }
variable "adm_ecs_cluster_autoscale_max"     { }
variable "adm_ecs_cluster_autoscale_min"     { }
variable "adm_ecs_cluster_autoscale_desired" { }
 
# ECS Service - Test

variable "adm_ecs_service_test_service_name"                   { }
variable "adm_ecs_service_test_task_name"                      { }
variable "adm_ecs_service_test_task_definition_file"           { }
variable "adm_ecs_service_test_container_name"                 { }
variable "adm_ecs_service_test_container_port"                 { }
variable "adm_ecs_service_test_desired_count"                  { }
variable "adm_ecs_service_role_arn"                            { }

variable "adm_ecs_service_test_elb_listener_instance_port"     { }
variable "adm_ecs_service_test_elb_listener_instance_protocol" { }
variable "adm_ecs_service_test_elb_listener_lb_port"           { }
variable "adm_ecs_service_test_elb_listener_lb_protocol"       { }
variable "adm_ecs_service_test_elb_ssl_cert_arn"               { }

variable "adm_ecs_service_test_elb_healthy_threshold"          { }
variable "adm_ecs_service_test_elb_unhealthy_threshold"        { }
variable "adm_ecs_service_test_elb_health_check_timeout"       { }
variable "adm_ecs_service_test_elb_health_check_url"           { }
variable "adm_ecs_service_test_elb_health_check_interval"      { }

variable "adm_ecs_service_test_elb_sec_group_ing_from_port"    { }
variable "adm_ecs_service_test_elb_sec_group_ing_to_port"      { }
variable "adm_ecs_service_test_elb_sec_group_ing_protocol"     { }
variable "adm_ecs_service_test_elb_sec_group_ing_cidr_blocks"  { }

variable "adm_ecs_service_test_elb_sec_group_eg_from_port"     { }
variable "adm_ecs_service_test_elb_sec_group_eg_to_port"       { }
variable "adm_ecs_service_test_elb_sec_group_eg_protocol"      { }

variable "adm_ecs_service_zone_id"         { }
variable "adm_ecs_service_test_dns_name"   { }


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

	# VPC nat instance Security Group id
	vpc_nat_instance_sg = "${var.adm_vpc_nat_sg}"

	ecs_instance_sec_group_ing_from_port = 22
	ecs_instance_sec_group_ing_to_port   = 22
	ecs_instance_sec_group_ing_protocol  = "tcp"
	ecs_instance_sec_group_ingress_cidrs = "10.85.0.0/16"

	ecs_instance_sec_group_eg_from_port = 0
	ecs_instance_sec_group_eg_to_port   = 0
	ecs_instance_sec_group_eg_protocol  = "-1"
}

module "test_ecs_service" {
	
	source = "../../../modules/aws/ecs-service"

	ecs_cluser_id        = "${module.ecs.cluster_id}"

	ecs_service_name     = "${var.adm_ecs_service_test_service_name}"
	ecs_task_name        = "${var.adm_ecs_service_test_task_name}"
	task_definition_file = "${var.adm_ecs_service_test_task_definition_file}"
	ecs_service_container_name = "${var.adm_ecs_service_test_container_name}"
	ecs_service_container_port = "${var.adm_ecs_service_test_container_port}"
	ecs_service_desired_count  = "${var.adm_ecs_service_test_desired_count}"
	ecs_service_role_arn = "${var.adm_ecs_service_role_arn}"


	vpc_id         = "${var.adm_vpc_id}"
	subnet_ids     = "${module.vpc.subnet_ids}"

	ecs_service_elb_listener_instance_port     = "${var.adm_ecs_service_test_elb_listener_instance_port}"
	ecs_service_elb_listener_instance_protocol = "${var.adm_ecs_service_test_elb_listener_instance_protocol}"
	ecs_service_elb_listener_lb_port           = "${var.adm_ecs_service_test_elb_listener_lb_port}"
	ecs_service_elb_listener_lb_protocol       = "${var.adm_ecs_service_test_elb_listener_lb_protocol}"
	ecs_service_elb_ssl_cert_arn               = "${var.adm_ecs_service_test_elb_ssl_cert_arn}"

	ecs_service_elb_healthy_threshold     = "${var.adm_ecs_service_test_elb_healthy_threshold}"
	ecs_service_elb_unhealthy_threshold   = "${var.adm_ecs_service_test_elb_unhealthy_threshold}"
	ecs_service_elb_health_check_timeout  = "${var.adm_ecs_service_test_elb_health_check_timeout}"
	ecs_service_elb_health_check_url      = "${var.adm_ecs_service_test_elb_health_check_url}"
	ecs_service_elb_health_check_interval = "${var.adm_ecs_service_test_elb_health_check_interval}"

	ecs_service_elb_sec_group_ing_from_port = "${var.adm_ecs_service_test_elb_sec_group_ing_from_port}"
	ecs_service_elb_sec_group_ing_to_port   = "${var.adm_ecs_service_test_elb_sec_group_ing_to_port}"
	ecs_service_elb_sec_group_ing_protocol  = "${var.adm_ecs_service_test_elb_sec_group_ing_protocol}"
	ecs_service_elb_sec_group_ing_cidr_blocks = "${var.adm_ecs_service_test_elb_sec_group_ing_cidr_blocks}"

	ecs_service_elb_sec_group_eg_from_port  = "${var.adm_ecs_service_test_elb_sec_group_eg_from_port}"
	ecs_service_elb_sec_group_eg_to_port    = "${var.adm_ecs_service_test_elb_sec_group_eg_to_port}"
	ecs_service_elb_sec_group_eg_protocol   = "${var.adm_ecs_service_test_elb_sec_group_eg_protocol}"
	ecs-service-instance-security-group-id  = "${module.ecs.cluster_instance_sg_id}"

	ecs_service_dns_zone_id = "${var.adm_ecs_service_zone_id}"
	ecs_service_dns_name    = "${var.adm_ecs_service_test_dns_name}"

}