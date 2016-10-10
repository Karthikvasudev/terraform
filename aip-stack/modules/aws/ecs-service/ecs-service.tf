
/*
 * TF module to create an ecs service. 
 * This stack consists of :
 *   -  ECS Service, Task, IAM role
 *   -  ELB to the Service instances
 *   -  DNS record to the Service
 */

# Variables  

/* ------------------------------------------------------------------------- */
 #  ECS Service, Task
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
	default = 1
}

variable "ecs_service_container_name" {
	description = "container name as mentioned in task definition file"
	default = "nginx"
}

variable "ecs_service_container_port" {
	description = "container port as mentioned in task definition file"
	default = 80
}

/* ------------------------------------------------------------------------- */
 # ELB for the ECS Service
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
	default = "http"
}
variable "ecs_service_elb_listener_lb_port" {
	description = "listener elb port"
	default = 443
}

variable "ecs_service_elb_listener_lb_protocol" {
	description = "listener elb protocol"
	default = "https"
}

variable "ecs_service_elb_ssl_cert_arn" {
	description = "elb ssl certificate arn"
}

variable "ecs_service_elb_healthy_threshold" {
	description = "elb health check threshold"
	default = 2
}

variable "ecs_service_elb_unhealthy_threshold" {
	description = "elb unhealthy threshold"
	default = 2
}

variable "ecs_service_elb_health_check_timeout" {
	description = "elb health check timeout"
	default = 3
}

variable "ecs_service_elb_health_check_url" {
	description = "elb health check url"
}

variable "ecs_service_elb_health_check_interval" {
	description = "elb health check interval"
	default = 30
}

variable "ecs_service_elb_sec_group_ing_from_port" {
	description = "elb security group - ingress port range begining from"
	default = 443
}

variable "ecs_service_elb_sec_group_ing_to_port" {
	description = "elb security group - ingress port range ends at"
	default = 443
}

variable "ecs_service_elb_sec_group_ing_protocol" {
	description = "elb security group - ingress protocol"
	default = "tcp"
}

variable "ecs_service_elb_sec_group_ing_cidr_blocks" {
	description = "elb security group - ingress cidr blocks"
	default = "0.0.0.0/0"
}

variable "ecs_service_elb_sec_group_eg_from_port" {
	description = "elb security group - egress port range begining from"
	default = 0
}

variable "ecs_service_elb_sec_group_eg_to_port" {
	description = "elb security group - egress port range ends at"
	default = 0
}

variable "ecs_service_elb_sec_group_eg_protocol" {
	description = "elb security group - egress protocol"
	default = "-1"
}

variable "ecs-service-instance-security-group-id" {
	description = "ecs service instance's security group id"
}

/* ------------------------------------------------------------------------- */
 # DNS Record
/* ------------------------------------------------------------------------- */

variable "ecs_service_dns_zone_id" {
	description = "zone id where ecs service dns record to be created"
}

variable "ecs_service_dns_name" {
	description = "domain name of the service"
}

# Resources

/* ------------------------------------------------------------------------- */
 # ECS service load balancer
/* ------------------------------------------------------------------------- */

/*
 * Load balancrer to associate to the ecs service hosted in the cluster
 */
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


/* ------------------------------------------------------------------------- */
 # ECS Service, Task, Service IAM role
/* ------------------------------------------------------------------------- */

/*
 * iam role to associate to the ecs container instances
 */
resource "aws_iam_role" "ecs-service-role" {
	name = "${var.ecs_service_name}-ecs-service-role"
	assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
	{
	  "Sid": "",
	  "Effect": "Allow",
	  "Principal": {
		"Service": "ecs.amazonaws.com"
	  },
	  "Action": "sts:AssumeRole"
	}
  ]
}
EOF
}

/*
 * attaches ecs managed policy to the ecs service iam role
 * Attached following managed policy documents
 *  - AmazonEC2ContainerServiceRole
 */
resource "aws_iam_role_policy" "ecs-service-policy" {
    name = "${var.ecs_service_name}-ecs-service-role-policy"
    role = "${aws_iam_role.ecs-service-role.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:Describe*",
        "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
        "elasticloadbalancing:Describe*",
        "elasticloadbalancing:RegisterInstancesWithLoadBalancer"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

/*
 * ecs task definition, task details to be provided in json file
 */
resource "aws_ecs_task_definition" "ecs_task" {
	family = "${var.ecs_task_name}"
	container_definitions = "${file(var.task_definition_file)}"

	volume = {
		name = "app-volume"
		host_path = "/opt/aip/${var.ecs_service_name}"
	}

	volume = {
		name = "nginx-config"
		host_path = "/root/config/${var.ecs_service_name}/nginx/nginx.conf"
	}
	
	volume = {
		name = "sso-config"
		host_path = "/opt/aip/${var.ecs_service_name}/seraph-config.xml"
	}
	
	volume = {
		name = "crowd-config"
		host_path = "/opt/aip/${var.ecs_service_name}/crowd.properties"
	}
	
	volume = {
		name = "dockersock-config"
		host_path = "/var/run/docker.sock"
	}
	
	volume = {
		name = "docker-volume"
		host_path = "/var/lib/docker"
	}
	
}

/*
 * creates cloudwatch log group for the service
 */
resource "aws_cloudwatch_log_group" "ecs_service_log_group" {
  name = "${var.ecs_service_name}-logs"
}

/*
 * creates ecs service, associates role and load balancer to the service
 */
resource "aws_ecs_service" "ecs_service" {
	name = "${var.ecs_service_name}"

	cluster         = "${var.ecs_cluser_id}"
	task_definition = "${aws_ecs_task_definition.ecs_task.arn}"
	desired_count   = "${var.ecs_service_desired_count}"
	iam_role        = "${aws_iam_role.ecs-service-role.arn}"

	depends_on = ["aws_iam_role.ecs-service-role"]

	load_balancer {
		elb_name = "${module.ecs_service_elb.elb_name}"
		container_name = "${var.ecs_service_container_name}"
		container_port = "${var.ecs_service_container_port}"
	}
}

/* 
 * sec group rule associated to the cluster instance to allow inbound to this service
 */
resource "aws_security_group_rule" "ecs_service_instance_sg_rule" {
	type = "ingress"
	from_port = "${var.ecs_service_elb_listener_instance_port}"
	to_port   = "${var.ecs_service_elb_listener_instance_port}"
	protocol  = "tcp"

	source_security_group_id = "${module.ecs_service_elb.elb_sg_id}"

	security_group_id = "${var.ecs-service-instance-security-group-id}"
}

/* ------------------------------------------------------------------------- */
 # DNS Record
/* ------------------------------------------------------------------------- */

/*
 * creates dns alias record for the service in route53 
 */
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

# Outputs

output "service_name" { value = "${aws_ecs_service.ecs_service.name}" }