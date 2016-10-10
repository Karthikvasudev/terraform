# ELB module  
# -------------------------------------  
  
This module creates an ELB and associates security group to it.  
  
# Inputs  
  
elb_name - Name of the elb to be created  
  
vpc_id     - VPC id where cluster instances to be created  
subnet_ids - Subnet ids in the vpc where cluster instances to be created  
  
listener_instance_port     - ELB listener instance port  
listener_instance_protocol - ELB listener instance protocol  
listener_lb_port           - ELB listener elb port  
listener_lb_protocol       - ELB listener elb protocol  
  
elb_ssl_cert_arn - Service's SSL certificate arn  
  
elb_healthy_threshold       - ELB health check threshold  
elb_unhealthy_threshold     - ELB unhealthy threshold  
elb_health_check_timeout    - ELB health check timeout  
elb_health_check_url        - ELB health check url  
elb_health_check_interval   - ELB health check interval  
  
elb_sec_group_ing_from_port   - ELB security group - ingress port range beginning from  
elb_sec_group_ing_to_port     - ELB security group - ingress port range ends at  
elb_sec_group_ing_protocol    - ELB security group - ingress protocol  
elb_sec_group_ing_cidr_blocks - ELB security group - ingress allow cidr blocks  
elb_sec_group_eg_from_port    - ELB security group - egress port range beginning from  
elb_sec_group_eg_to_port      - ELB security group - egress port range ends at  
elb_sec_group_eg_protocol     - ELB security group - egress protocol  
  
  
# Outputs  
  
elb_id     - Id of the ELB created  
elb_name   - Name of the ELB created  
dns_name   - ELB's DNS name  
zone_id    - ELB's zone id  
elb_sg_id  - Id of the security group associated to the ELB  
  
  
# Usage  
  
 module "ecs_service_elb" {  
  
	source = "../elb"  
  
	elb_name   = "${var.ecs_service_name}-elb"  
  
	vpc_id     = "${var.vpc_id}"  
	subnet_ids = "${var.subnet_ids}"  
  
	listener_instance_port      = "${var.ecs_service_elb_listener_instance_port}"  
	listener_instance_protocol  = "${var.ecs_service_elb_listener_instance_protocol}"  
	listener_lb_port            = "${var.ecs_service_elb_listener_lb_port}"  
	listener_lb_protocol        = "${var.ecs_service_elb_listener_lb_protocol}"  
	elb_ssl_cert_arn            = "${var.ecs_service_elb_ssl_cert_arn}"  
  
	elb_healthy_threshold       = "${var.ecs_service_elb_healthy_threshold}"  
	elb_unhealthy_threshold     = "${var.ecs_service_elb_unhealthy_threshold}"  
	elb_health_check_timeout    = "${var.ecs_service_elb_health_check_timeout}"  
	elb_health_check_url        = "${var.ecs_service_elb_health_check_url}"  
	elb_health_check_interval   = "${var.ecs_service_elb_health_check_interval}"  
  
	elb_sec_group_ing_from_port   = "${var.ecs_service_elb_sec_group_ing_from_port}"  
	elb_sec_group_ing_to_port     = "${var.ecs_service_elb_sec_group_ing_to_port}"  
	elb_sec_group_ing_protocol    = "${var.ecs_service_elb_sec_group_ing_protocol}"  
	elb_sec_group_ing_cidr_blocks = "${var.ecs_service_elb_sec_group_ing_cidr_blocks}"  
	  
	elb_sec_group_eg_from_port  = "${var.ecs_service_elb_sec_group_eg_from_port}"  
	elb_sec_group_eg_to_port    = "${var.ecs_service_elb_sec_group_eg_to_port}"  
	elb_sec_group_eg_protocol   = "${var.ecs_service_elb_sec_group_eg_protocol}"  
}