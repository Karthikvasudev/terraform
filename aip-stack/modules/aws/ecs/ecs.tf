/*
 * TF configuration to create an ecs cluster
 *    add ec2 instance to the cluster
 */

# Variables

variable "cluster_name" {
	description = "name of the ecs cluster"
}

variable "ami_id" {
	description = "ecs optimized amazon linux ami"
}

variable "instance_type" { 
	description = "instance type to be provisioned"
	default = "t2.micro" 
}

variable "keypair_name" {
	description = "keypair name to be used for instance"    
}

variable "user_data_file" {
	description = "environment specific user-date file"
}

variable "vpc_id" {
	description = "vpc_id in the vpc where instances created"
}

variable "subnet_ids" {
	description = "subnet ids in the vpc where instances created"
}

variable "azs" {
	description = "availability zones where instances created"
}

variable "as_max_size" { 
	description = "maximum number of instances in the cluster"
	default = 2
}

variable "as_min_size" { 
	description = "minimum number of instances in the cluster"
	default = 1
}

variable "as_desired_capacity" { 
	description = "desirec number of instnces in the cluster"
	default = 1
}

variable "elbs" {
	description = "List of elbs to associate to autoscaling group"
}

variable "vpc_nat_instance_sg" {
	description = "Security group associated to VPC's nat instance"
}



# Resources

resource "aws_ecs_cluster" "ecs" {
	name = "${var.cluster_name}"
}


/*
 *  iam role with trust policy
 */

resource "aws_iam_role" "ecs-instance-role" {
	name = "${var.cluster_name}-role"
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

resource "aws_iam_policy_attachment" "ecs-instance-policy" {
	name = "${var.cluster_name}-instance-policy"
	roles = ["${aws_iam_role.ecs-instance-role.name}"]
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}


/*
 * instance profile with iam role
 */

resource "aws_iam_instance_profile" "ecs-instance-profile" {
	name = "${var.cluster_name}-instance-profile"
	roles = ["${aws_iam_role.ecs-instance-role.name}"]
}


/*
 * ecs cluster instance security group
 */

resource "aws_security_group" "ecs-instance-security-group" {
	name = "${var.cluster_name}-sg"
	description = "Sec group associated to ${var.cluster_name} instance"
	vpc_id = "${var.vpc_id}"

	ingress {
		from_port = 8000
		to_port = 9000
		protocol = "tcp"
		#security_groups = replace cidr block with id of aip-adm-sg-elb
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags {
		Name = "${var.cluster_name}-sg"
	}	
}


/*
 * ec2 launch configuraion 
 * inputs : ami id, instance type, user_data file, keypair name
 */

resource "aws_launch_configuration" "ecs-cluster-launch-configuration" {
	name = "${var.cluster_name}-launch-configuration"

	image_id = "${var.ami_id}"
	instance_type ="${var.instance_type}"
	iam_instance_profile = "${aws_iam_instance_profile.ecs-instance-profile.name}"

	user_data = "${file(var.user_data_file)}"
	security_groups = ["${aws_security_group.ecs-instance-security-group.id}"]
	key_name = "${var.keypair_name}"
}


/*
 * auto scaling group
 * inputs: azs, max_size, min_size, desired capacity
 */

resource "aws_autoscaling_group" "ecs-cluster-autoscaling-group" {
	name = "${var.cluster_name}-autoscaling-group"

	launch_configuration = "${aws_launch_configuration.ecs-cluster-launch-configuration.name}"

	vpc_zone_identifier = ["${split(",", var.subnet_ids)}"]
	availability_zones = ["${split(",", var.azs)}"]

	max_size = "${var.as_max_size}"
	min_size = "${var.as_min_size}"
	health_check_grace_period = 300
	health_check_type = "ELB"
	desired_capacity = "${var.as_desired_capacity}"
	force_delete = true

	load_balancers = ["${split(",", var.elbs)}"]

	tag {
		key = "Name"
		value = "${var.cluster_name}-instance"
		propagate_at_launch = true
	}
}


resource "aws_security_group_rule" "vpc_nat_sg" {
	type = "ingress"
	from_port = 443
	to_port = 443
	protocol = "tcp"

	source_security_group_id = "${aws_security_group.ecs-instance-security-group.id}"

	security_group_id = "${var.vpc_nat_instance_sg}"
}
