/*
 * TF configuration to create an ecs cluster
 * and add ec2 instances to the cluster
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

variable "vpc_nat_instance_sg" {
	description = "Security group associated to VPC's nat instance"
}

variable "ecs_instance_sec_group_ing_from_port" {
	description = "ecs instance sec group - ingress 'from port'"
	default = 22
}

variable "ecs_instance_sec_group_ing_to_port" {
	description = "ecs instance sec group - ingress 'to port'"
	default = 22
}

variable "ecs_instance_sec_group_ing_protocol" {
	description = "ecs_instance_sec_group_ing_protocol"
	default = "tcp"
}

variable "ecs_instance_sec_group_ingress_cidrs" {
	description = "ecs_instance_sec_group_ingress_cidrs"
}

variable "ecs_instance_sec_group_eg_from_port" {
	description = "ecs_instance_sec_group_eg_from_port"
	default = 0
}

variable "ecs_instance_sec_group_eg_to_port" {
	description = "ecs_instance_sec_group_eg_to_port"
	default = 0
}

variable "ecs_instance_sec_group_eg_protocol" {
	description = "ecs_instance_sec_group_eg_protocol"
	default = "-1"
}


# Resources

/*
 * creates an ecs cluster
 */
resource "aws_ecs_cluster" "ecs" {
	name = "${var.cluster_name}"
}

/*
 *  ecs instance iam role with trust policy
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
 * Attached following managed policy documents
 *  - AmazonEC2ContainerServiceforEC2Role
 *  - AmazonEC2ContainerRegistryFullAccess
 *  - AmazonS3FullAccess
 */
resource "aws_iam_role_policy" "ecs-instance-policy" {
    name = "${var.cluster_name}-instance-policy"
    role = "${aws_iam_role.ecs-instance-role.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
EOF
}

/*
 * instance profile with ecs instance iam role
 */
resource "aws_iam_instance_profile" "ecs-instance-profile" {
	name = "${var.cluster_name}-instance-profile"
	roles = ["${aws_iam_role.ecs-instance-role.name}"]
}


/*
 * security group associated to the ecs cluster instances
 */
resource "aws_security_group" "ecs-instance-security-group" {
	name = "${var.cluster_name}-instance-sg"
	description = "Sec group associated to ${var.cluster_name} instance"
	vpc_id = "${var.vpc_id}"

	ingress {
		from_port = "${var.ecs_instance_sec_group_ing_from_port}"
		to_port   = "${var.ecs_instance_sec_group_ing_to_port}"
		protocol  = "${var.ecs_instance_sec_group_ing_protocol}"
		cidr_blocks = ["${split(",", var.ecs_instance_sec_group_ingress_cidrs)}"]
	}

	egress {
		from_port = "${var.ecs_instance_sec_group_eg_from_port}"
		to_port   = "${var.ecs_instance_sec_group_eg_to_port}"
		protocol  = "${var.ecs_instance_sec_group_eg_protocol}"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags {
		Name = "${var.cluster_name}-instance-sg"
	}
}

/*
 * ec2 launch configuraion of the cluster instances
 */
resource "aws_launch_configuration" "ecs-cluster-launch-configuration" {
	name = "${var.cluster_name}-launch-configuration"

	image_id = "${var.ami_id}"
	instance_type ="${var.instance_type}"
	iam_instance_profile = "${aws_iam_instance_profile.ecs-instance-profile.name}"

	user_data = "${file(var.user_data_file)}"
	security_groups = ["${aws_security_group.ecs-instance-security-group.id}"]
	key_name = "${var.keypair_name}"

	depends_on = ["aws_iam_instance_profile.ecs-instance-profile"]
}

/*
 * auto scaling group to associate to the cluster instances
 */
resource "aws_autoscaling_group" "ecs-cluster-autoscaling-group" {
	name = "${var.cluster_name}-autoscaling-group"

	launch_configuration = "${aws_launch_configuration.ecs-cluster-launch-configuration.name}"

	vpc_zone_identifier = ["${split(",", var.subnet_ids)}"]
	availability_zones  = ["${split(",", var.azs)}"]

	max_size = "${var.as_max_size}"
	min_size = "${var.as_min_size}"
	health_check_grace_period = 300
	health_check_type = "EC2"
	desired_capacity  = "${var.as_desired_capacity}"
	force_delete = true

	tag {
		key   = "Name"
		value = "${var.cluster_name}-instance"
		propagate_at_launch = true
	}
}

/*
 * allow cluster instance to access nat instance over SSL port
 */
resource "aws_security_group_rule" "vpc_nat_sg" {
	type = "ingress"
	from_port = 443
	to_port   = 443
	protocol  = "tcp"

	source_security_group_id = "${aws_security_group.ecs-instance-security-group.id}"

	security_group_id = "${var.vpc_nat_instance_sg}"
}

/*
 * allow cluster instance to access nat instance over port 80 (needed for yum install)
 */
resource "aws_security_group_rule" "vpc_nat_sg_rule2" {
	type = "ingress"
	from_port = 80
	to_port   = 80
	protocol  = "tcp"

	source_security_group_id = "${aws_security_group.ecs-instance-security-group.id}"

	security_group_id = "${var.vpc_nat_instance_sg}"
}


# Outputs

output "cluster_id" { value = "${aws_ecs_cluster.ecs.id}" }
output "cluster_instance_sg_id" { value = "${aws_security_group.ecs-instance-security-group.id}"}