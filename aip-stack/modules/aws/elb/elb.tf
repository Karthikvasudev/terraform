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
	description = "elb health check threshold"
}

variable "elb_unhealthy_threshold" {
	description = "elb unhealthy threshold"
}

variable "elb_health_check_timeout" {
	description = "elb health check timeout"
}

variable "elb_health_check_url" {
	description = "elb health check url"
}

variable "elb_health_check_interval" {
	description = "elb health check interval"
}

variable "elb_sec_group_ing_from_port" {
	description = "elb security port - ingress port range begining from"
}

variable "elb_sec_group_ing_to_port" {
	description = "elb security port - ingress port range ends at"
}

variable "elb_sec_group_ing_protocol" {
	description = "elb security port - ingress protocol"
}

variable "elb_sec_group_ing_cidr_blocks" {
	description = "elb security group - ingress allow cidr blocks"
}

variable "elb_sec_group_eg_from_port" {
	description = "elb security port - egress port range begining from"
}

variable "elb_sec_group_eg_to_port" {
	description = "elb security port - egress port range ends at"
}

variable "elb_sec_group_eg_protocol" {
	description = "elb security port - egress protocol"
}


# Resources

/*
 * elb security group
 */
resource "aws_security_group" "elb-security-group" {
	name = "${var.elb_name}-sg"
	description = "Sec group associated to ${var.elb_name} load balancer"
	vpc_id = "${var.vpc_id}"

	ingress {
		from_port = "${var.elb_sec_group_ing_from_port}"
		to_port   = "${var.elb_sec_group_ing_to_port}"
		protocol  = "${var.elb_sec_group_ing_protocol}"
		cidr_blocks = ["${split(",", var.elb_sec_group_ing_cidr_blocks)}"]
	}

	egress {
		from_port = "${var.elb_sec_group_eg_from_port}"
		to_port   = "${var.elb_sec_group_eg_to_port}"
		protocol  = "${var.elb_sec_group_eg_protocol}"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags {
		Name = "${var.elb_name}-sg"
	}
}

/*
 * creates elb and associates security group
 */
resource "aws_elb" "elb" {
	name = "${var.elb_name}"

	internal = "true"
	subnets = ["${split(",", var.subnet_ids)}"]
	security_groups = ["${aws_security_group.elb-security-group.id}"]

	listener {
		instance_port      = "${var.listener_instance_port}"
		instance_protocol  = "${var.listener_instance_protocol}"
		lb_port            = "${var.listener_lb_port}"
		lb_protocol        = "${var.listener_lb_protocol}"
		ssl_certificate_id = "${var.elb_ssl_cert_arn}"
	}

	health_check {
		healthy_threshold   = "${var.elb_healthy_threshold}"
		unhealthy_threshold = "${var.elb_unhealthy_threshold}"
		timeout             = "${var.elb_health_check_timeout}"
		target              = "${var.elb_health_check_url}"
		interval            = "${var.elb_health_check_interval}"
	}

	tags {
		Name = "${var.elb_name}"
	}
} 

# Outputs

output "elb_id"	    { value = "${aws_elb.elb.id}" }
output "elb_name"   { value = "${aws_elb.elb.name}" }
output "dns_name"   { value = "${aws_elb.elb.dns_name}" }
output "zone_id"    { value = "${aws_elb.elb.zone_id}" }

output "elb_sg_id"	{ value = "${aws_security_group.elb-security-group.id}" }