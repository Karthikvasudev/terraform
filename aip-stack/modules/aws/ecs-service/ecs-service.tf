
/*
 * TF module to create an ecs service. 
 * This stack consists of :
 *   -  ECS Service, Task
 *   -  ELB to the Service instances
 *   -  DNS record to the Service
 */

/* ------------------------------------------------------------------------- */
 # Variables  - ECS Service, Task
/* ------------------------------------------------------------------------- */

variable "ecs_service_name" {
	description = "name of the ecs service"
}

variable "ecs_task_name" {
	description = "name of the task associated to the service"
}

variable "task_definition_file" {
	description = "task defintion file path"
}

variable "ecs_cluser_id" {
	description = "id of the ecs cluster where service to be deployed"
}

variable "ecs_service_desired_count" {
	description = "desired count of the ecs service containers"
}

variable "ecs_service_container_name" {
	description = "container name as mentioned in task definition file"
}

variable "ecs_service_container_port" {
	description = "container port as mentioned in task definition file"
}

/* ------------------------------------------------------------------------- */
 # Variables  - ELB for the ECS Service
/* ------------------------------------------------------------------------- */

variable "vpc_id" {
	description = "vpc_id in the vpc where instances created"
}

variable "subnet_ids" {
	description = "list of subnet_ids"
}

variable "ecs_service_elb_listener_instance_port" {
	description = "listener instance port"
}

variable "ecs_service_elb_listener_instance_protocol" {
	description = "listener instance protocol"
}
variable "ecs_service_elb_listener_lb_port" {
	description = "listener elb port"
}

variable "ecs_service_elb_listener_lb_protocol" {
	description = "listener elb protocol"
}

variable "ecs_service_elb_ssl_cert_arn" {
	description = "elb ssl certificate arn"
}

variable "ecs_service_elb_healthy_threshold" {
	description = "elb_health_check_threshold"
}

variable "ecs_service_elb_unhealthy_threshold" {
	description = "elb_unhealthy_threshold"
}

variable "ecs_service_elb_health_check_timeout" {
	description = "elb_health_check_timeout"
}

variable "ecs_service_elb_health_check_url" {
	description = "elb_health_check_url"
}

variable "ecs_service_elb_health_check_interval" {
	description = "elb_health_check_interval"
}

variable "ecs_service_elb_sec_group_ing_from_port" {
	description = "elb security port - ingress port range begining from"
}

variable "ecs_service_elb_sec_group_ing_to_port" {
	description = "elb security port - ingress port range ends at"
}

variable "ecs_service_elb_sec_group_ing_protocol" {
	description = "elb security port - ingress protocol"
}

variable "ecs_service_elb_sec_group_eg_from_port" {
	description = "elb security port - egress port range begining from"
}

variable "ecs_service_elb_sec_group_eg_to_port" {
	description = "elb security port - egress port range ends at"
}

variable "ecs_service_elb_sec_group_eg_protocol" {
	description = "elb security port - egress protocol"
}

/* ------------------------------------------------------------------------- */
 # Variables  - DNS Record
/* ------------------------------------------------------------------------- */

variable "ecs_service_dns_zone_id" {
	description = "zone id where ecs service dns record to be created"
}

variable "ecs_service_dns_name" {
	description = "domain name of the service"
}


/* ------------------------------------------------------------------------- */
 # Resources - ECS service load balancer
/* ------------------------------------------------------------------------- */

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

	elb_sec_group_ing_from_port = "${var.ecs_service_elb_sec_group_ing_from_port}"
	elb_sec_group_ing_to_port   = "${var.ecs_service_elb_sec_group_ing_to_port}"
	elb_sec_group_ing_protocol  = "${var.ecs_service_elb_sec_group_ing_protocol}"
	
	elb_sec_group_eg_from_port  = "${var.ecs_service_elb_sec_group_eg_from_port}"
	elb_sec_group_eg_to_port    = "${var.ecs_service_elb_sec_group_eg_to_port}"
	elb_sec_group_eg_protocol   = "${var.ecs_service_elb_sec_group_eg_protocol}"
}


/* ------------------------------------------------------------------------- */
 # Resources - ECS Service, Task, Service IAM role
/* ------------------------------------------------------------------------- */

/*
 *  iam role with trust policy
 */

resource "aws_iam_role" "ecs-service-role" {
	name = "${var.ecs_service_name}-service-role"
	assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
	{
	  "Sid": "",
	  "Effect": "Allow",
	  "Principal": {
		"Service": "ec2.amazonaws.com"
	  },
	  "Action": "sts:AssumeRole"
	}
  ]
}
EOF
}


/*
 * attach ecs managed policy to the iam role
 */

resource "aws_iam_policy_attachment" "ecs-service-policy" {
	name = "${var.ecs_service_name}-service-policy"
	roles = ["${aws_iam_role.ecs-service-role.name}"]
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}


resource "aws_ecs_task_definition" "ecs_task" {
	family = "${var.ecs_task_name}"
	container_definitions = "${file(var.task_definition_file)}"
}

resource "aws_ecs_service" "ecs_service" {
	name = "${var.ecs_service_name}"

	cluster         = "${var.ecs_cluser_id}"
	task_definition = "${aws_ecs_task_definition.ecs_task.arn}"
	desired_count   = "${var.ecs_service_desired_count}"
	#iam_role        = "${aws_iam_role.ecs-service-role.arn}"
	iam_role        = "arn:aws:iam::661072482170:role/nginx-service-role-tmp"

	depends_on = ["aws_iam_role.ecs-service-role", "aws_iam_policy_attachment.ecs-service-policy"]

	load_balancer {
		elb_name = "${module.ecs_service_elb.elb_name}"
		container_name = "${var.ecs_service_container_name}"
		container_port = "${var.ecs_service_container_port}"
	}
}


/* ------------------------------------------------------------------------- */
 # Resources - DNS Record
/* ------------------------------------------------------------------------- */

resource "aws_route53_record" "ecs_service_dns" {
	zone_id = "${var.ecs_service_dns_zone_id}"
	name    = "${var.ecs_service_dns_name}"
	type    = "A"

	alias {
		name    = "${module.ecs_service_elb.dns_name}"
		zone_id = "${module.ecs_service_elb.zone_id}"
		evaluate_target_health = true
	}
}