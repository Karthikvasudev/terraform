/*
 * TF configuration to create a swarm cluster
 * and add ec2 instances to the cluster
 */

# Variables

variable "cluster_name" {
	description = "name of the swarm cluster"
}

variable "node_ami_id" {
	type = "string"
	description = "ami_id of the cluster instance"
}

variable "node_ec2_type" {
	type = "string"
	description = "node ec2 instance type"
	default =  "t2.small"
}

variable "node_ec2_keypair" {
	type = "string"
	description = "keypair to be used for node instance"
}

variable "node_reg_secret_token" {
	type = "string"
	description = "secret token to join the cluster"
}

variable "node_user_data_file" {
	description = "manager join user-date file"
	default = "../../../modules/aws/cluster/cluster_user_data.sh"
}

variable "vpc_id" {
	description = "vpc_id in the vpc where instances created"
}

variable "node_asg_subnet_ids" {
	description = "subnet ids in the vpc where instances created"
}

variable "node_asg_azs" {
	description = "availability zones where instances created"
}

variable "node_asg_max_size" { 
	description = "maximum number of instances in the cluster"
	default = 9
}

variable "node_asg_min_size" { 
	description = "minimum number of instances in the cluster"
	default = 3
}

variable "node_asg_desired_capacity" { 
	description = "desirec number of instnces in the cluster"
	default = 3
}

variable "node_sec_group_ing_from_port" {
	description = "swarm instance sec group - ingress 'from port'"
	default = 22
}

variable "node_sec_group_ing_to_port" {
	description = "swarm instance sec group - ingress 'to port'"
	default = 22
}

variable "node_sec_group_ing_protocol" {
	description = "node_sec_group_ing_protocol"
	default = "tcp"
}

variable "node_sec_group_ingress_cidrs" {
	description = "node_sec_group_ingress_cidrs"
}

variable "node_sec_group_eg_from_port" {
	description = "node_sec_group_eg_from_port"
	default = 0
}

variable "node_sec_group_eg_to_port" {
	description = "node_sec_group_eg_to_port"
	default = 0
}

variable "node_sec_group_eg_protocol" {
	description = "node_sec_group_eg_protocol"
	default = "-1"
}


# Resources

/*
 *  swarm instance iam role with trust policy
 */
resource "aws_iam_role" "swarm-instance-role" {
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
 * attach managed policy to the iam role
 * Attached following managed policy documents
 *  - AmazonEC2ContainerRegistryFullAccess
 *  - AmazonS3FullAccess
 */
resource "aws_iam_role_policy" "swarm-instance-policy" {
    name = "${var.cluster_name}-instance-policy"
    role = "${aws_iam_role.swarm-instance-role.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
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
 * instance profile with swarm instance iam role
 */
resource "aws_iam_instance_profile" "swarm-instance-profile" {
	name = "${var.cluster_name}-instance-profile"
	roles = ["${aws_iam_role.swarm-instance-role.name}"]
}


/*
 * security group associated to the swarm cluster manager instances
 */
resource "aws_security_group" "swarm-instance-security-group" {
	name = "${var.cluster_name}-sg-swarm-instance"
	description = "Sec group associated to ${var.cluster_name} instance"
	vpc_id = "${var.vpc_id}"

	ingress {
		from_port = "${var.node_sec_group_ing_from_port}"
		to_port   = "${var.node_sec_group_ing_to_port}"
		protocol  = "${var.node_sec_group_ing_protocol}"
		cidr_blocks = ["${split(",", var.node_sec_group_ingress_cidrs)}"]
	}

	egress {
		from_port = "${var.node_sec_group_eg_from_port}"
		to_port   = "${var.node_sec_group_eg_to_port}"
		protocol  = "${var.node_sec_group_eg_protocol}"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags {
		Name = "${var.cluster_name}-sg-swarm-instance"
	}
}

resource "aws_security_group" "swarm-node-security-group" {
	name = "${var.cluster_name}-sg-swarm-node"
	description = "Sec group associated to ${var.cluster_name} instance"
	vpc_id = "${var.vpc_id}"

	tags {
		Name = "${var.cluster_name}-sg-swarm-node"
	}
}

resource "aws_security_group_rule" "swarm-node-security-group-rule-2" {
	type = "ingress"
	from_port = 2375
	to_port   = 2377
	protocol  = "tcp"

	source_security_group_id = "${aws_security_group.swarm-node-security-group.id}"

	security_group_id = "${aws_security_group.swarm-node-security-group.id}"
}


/*
 * ec2 launch configuraion of the cluster instances
 */


resource "template_file" "node_user_data_tpl" {
	template = "${file(var.node_user_data_file)}"

	vars {
		NODE_REG_SECRET_TOKEN = "${var.node_reg_secret_token}"

	}
}

resource "aws_launch_configuration" "swarm-node-launch-configuration" {
	name = "${var.cluster_name}-launch-configuration"

	image_id = "${var.node_ami_id}"
	instance_type ="${var.node_ec2_type}"
	iam_instance_profile = "${aws_iam_instance_profile.swarm-instance-profile.name}"

	user_data = "${template_file.node_user_data_tpl.rendered}"
	security_groups = ["${aws_security_group.swarm-instance-security-group.id}","${aws_security_group.swarm-node-security-group.id}"]
	key_name = "${var.node_ec2_keypair}"

	depends_on = ["aws_iam_instance_profile.swarm-instance-profile"]
}

/*
 * auto scaling group to associate to the cluster instances
 */
resource "aws_autoscaling_group" "swarm-node-autoscaling-group" {
	name = "${var.cluster_name}-asg-swarm1-node"

	launch_configuration = "${aws_launch_configuration.swarm-node-launch-configuration.name}"

	vpc_zone_identifier = ["${split(",", var.node_asg_subnet_ids)}"]
	availability_zones  = ["${split(",", var.node_asg_azs)}"]

	max_size = "${var.node_asg_max_size}"
	min_size = "${var.node_asg_min_size}"
	health_check_grace_period = 300
	health_check_type = "EC2"
	desired_capacity  = "${var.node_asg_desired_capacity}"
	force_delete = true

	tag {
		key   = "Name"
		value = "${var.cluster_name}-ec2-swarm1-node"
		propagate_at_launch = true
	}

	depends_on = ["aws_iam_instance_profile.swarm-instance-profile"]
}

# Outputs

output "cluster_instance_sg_id" { value = "${aws_security_group.swarm-instance-security-group.id}"}