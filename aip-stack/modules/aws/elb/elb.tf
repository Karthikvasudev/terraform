/*
 * TF module to create ELB for a given autoscaling group
 */

# Variables

variable "elb_name" {
	description = "name of the elb"
}

variable "vpc_id" {
	description = "vpc_id in the vpc where instances created"
}

variable "subnet_ids" {
	description = "list of subnet_ids"
}

variable "listener_instance_port" {
	description = "listener instance port"
}

variable "listener_instance_protocol" {
	description = "listener instance protocol"
}
variable "listener_lb_port" {
	description = "listener elb port"
}

variable "listener_lb_protocol" {
	description = "listener elb protocol"
}

variable "elb_ssl_cert_arn" {
	description = "elb ssl certificate arn"
}

variable "elb_healthy_threshold" {
	description = "elb_health_check_threshold"
}

variable "elb_unhealthy_threshold" {
	description = "elb_unhealthy_threshold"
}

variable "elb_health_check_timeout" {
	description = "elb_health_check_timeout"
}

variable "elb_health_check_url" {
	description = "elb_health_check_url"
}

variable "elb_health_check_interval" {
	description = "elb_health_check_interval"
}

# Resources

/*
 * elb instance security group
 */

resource "aws_security_group" "elb-security-group" {
	name = "${var.elb_name}-sg"
	description = "Sec group associated to ${var.elb_name} load balancer"
	vpc_id = "${var.vpc_id}"

	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		#security_groups = replace cidr block appropriately
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 8000
		to_port = 9000
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags {
		Name = "${var.elb_name}-sg"
	}
}

resource "aws_elb" "elb" {
	name = "${var.elb_name}"

	internal = "true"
	subnets = ["${split(",", var.subnet_ids)}"]
	security_groups = ["${aws_security_group.elb-security-group.id}"]

	listener {
		instance_port = "${var.listener_instance_port}"
		instance_protocol = "${var.listener_instance_protocol}"
		lb_port = "${var.listener_lb_port}"
		lb_protocol = "${var.listener_lb_protocol}"
		ssl_certificate_id = "${var.elb_ssl_cert_arn}"
	}

	health_check {
		healthy_threshold = "${var.elb_healthy_threshold}"
		unhealthy_threshold = "${var.elb_unhealthy_threshold}"
		timeout = "${var.elb_health_check_timeout}"
		target = "${var.elb_health_check_url}"
		interval = "${var.elb_health_check_interval}"
	}

	tags {
		Name = "${var.elb_name}"
	}
} 

output "elb_id"	{ value = "${aws_elb.elb.id}" }
output "elb_sg_id"	{ value = "${aws_security_group.elb-security-group.id}" }