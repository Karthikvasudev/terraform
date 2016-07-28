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

variable "node_mgr_ec2_type" {
	type = "string"
	description = "node ec2 instance type"
	default =  "t2.small"
}

variable "node_wkr_ec2_type" {
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

variable "init_user_data_file" {
	description = "cluster init specific user-date file"
	default = "../../../modules/aws/cluster/cluster_init_user_data.sh"
}

variable "manager_user_data_file" {
	description = "manager join user-date file"
	default = "../../../modules/aws/cluster/mgr_cluster_join_user_data.sh"
}

variable "worker_user_data_file" {
	description = "worker join user-date file"
	default = "../../../modules/aws/cluster/wkr_cluster_join_user_data.sh"
}

variable "vpc_id" {
	description = "vpc_id in the vpc where instances created"
}

variable "mgr_asg_subnet_ids" {
	description = "subnet ids in the vpc where instances created"
}

variable "mgr_asg_azs" {
	description = "availability zones where instances created"
}

variable "mgr_asg_max_size" { 
	description = "maximum number of instances in the cluster"
	default = 5
}

variable "mgr_asg_min_size" { 
	description = "minimum number of instances in the cluster"
	default = 2
}

variable "mgr_asg_desired_capacity" { 
	description = "desirec number of instnces in the cluster"
	default = 2
}

variable "wkr_asg_subnet_ids" {
	description = "subnet ids in the vpc where instances created"
}

variable "wkr_asg_azs" {
	description = "availability zones where instances created"
}

variable "wkr_asg_max_size" { 
	description = "maximum number of instances in the cluster"
	default = 9
}

variable "wkr_asg_min_size" { 
	description = "minimum number of instances in the cluster"
	default = 3
}

variable "wkr_asg_desired_capacity" { 
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
	name = "${var.cluster_name}-instance-sg"
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
		Name = "${var.cluster_name}-instance-sg"
	}
}

resource "aws_security_group" "manager-node-security-group" {
	name = "${var.cluster_name}-manager-instance-sg"
	description = "Sec group associated to ${var.cluster_name} instance"
	vpc_id = "${var.vpc_id}"

/*	ingress {
		from_port = 2376
		to_port   = 2377
		protocol  = "tcp"
		source_security_group_id = "${aws_security_group.worker-node-security-group.id}"
	}
*/
	tags {
		Name = "${var.cluster_name}-manager-instance-sg"
	}
}

resource "aws_security_group_rule" "manager-node-security-group-rule-1" {
	type = "ingress"
	from_port = 2375
	to_port   = 2377
	protocol  = "tcp"

	source_security_group_id = "${aws_security_group.worker-node-security-group.id}"

	security_group_id = "${aws_security_group.manager-node-security-group.id}"
}

resource "aws_security_group_rule" "manager-node-security-group-rule-2" {
	type = "ingress"
	from_port = 2375
	to_port   = 2377
	protocol  = "tcp"

	source_security_group_id = "${aws_security_group.manager-node-security-group.id}"

	security_group_id = "${aws_security_group.manager-node-security-group.id}"
}

resource "aws_security_group" "worker-node-security-group" {
	name = "${var.cluster_name}-worker-instance-sg"
	description = "Sec group associated to ${var.cluster_name} instance"
	vpc_id = "${var.vpc_id}"

/*	ingress {
		from_port = 2376
		to_port   = 2377
		protocol  = "tcp"
		source_security_group_id = "${aws_security_group.manager-node-security-group.id}"
	}*/

	tags {
		Name = "${var.cluster_name}-worker-instance-sg"
	}
}

resource "aws_security_group_rule" "worker-node-security-group-rule" {
	type = "ingress"
	from_port = 2375
	to_port   = 2377
	protocol  = "tcp"

	source_security_group_id = "${aws_security_group.manager-node-security-group.id}"

	security_group_id = "${aws_security_group.worker-node-security-group.id}"
}

resource "template_file" "init_user_data_tpl" {
	template = "${file(var.init_user_data_file)}"

	vars {
		NODE_REG_SECRET_TOKEN = "${var.node_reg_secret_token}"
	}
}

resource "aws_instance" "cluster_init_instance" {
	ami             = "${var.node_ami_id}"
	instance_type   = "${var.node_mgr_ec2_type}"
	subnet_id       = "${element(split(",", var.mgr_asg_subnet_ids),0)}"
	availability_zone = "${element(split(",", var.mgr_asg_azs),0)}"
	security_groups = ["${aws_security_group.swarm-instance-security-group.id}","${aws_security_group.manager-node-security-group.id}"]
	key_name        = "${var.node_ec2_keypair}"
	
	user_data       = "${template_file.init_user_data_tpl.rendered}"

	tags {
		Name = "${var.cluster_name}-manager-init-node"
	}

	iam_instance_profile = "${aws_iam_instance_profile.swarm-instance-profile.name}"

	depends_on = ["aws_iam_instance_profile.swarm-instance-profile"]
}

/*
 * ec2 launch configuraion of the cluster instances
 */


resource "template_file" "mgr_user_data_tpl" {
	template = "${file(var.manager_user_data_file)}"

	vars {
		NODE_REG_SECRET_TOKEN = "${var.node_reg_secret_token}"
		MGR_HOST_IP = "${aws_instance.cluster_init_instance.private_ip}"
	}
}


resource "aws_launch_configuration" "swarm-manager-node-launch-configuration" {
	name = "${var.cluster_name}-manager-launch-configuration"

	image_id = "${var.node_ami_id}"
	instance_type ="${var.node_mgr_ec2_type}"
	iam_instance_profile = "${aws_iam_instance_profile.swarm-instance-profile.name}"

	user_data = "${template_file.mgr_user_data_tpl.rendered}"
	security_groups = ["${aws_security_group.swarm-instance-security-group.id}","${aws_security_group.manager-node-security-group.id}"]
	key_name = "${var.node_ec2_keypair}"

	depends_on = ["aws_iam_instance_profile.swarm-instance-profile","aws_instance.cluster_init_instance"]
}

/*
 * auto scaling group to associate to the cluster instances
 */
resource "aws_autoscaling_group" "manager-node-autoscaling-group" {
	name = "${var.cluster_name}-manager-autoscaling-group"

	launch_configuration = "${aws_launch_configuration.swarm-manager-node-launch-configuration.name}"

	vpc_zone_identifier = ["${element(split(",", var.mgr_asg_subnet_ids),1)}","${element(split(",", var.mgr_asg_subnet_ids),2)}"]
	availability_zones  = ["${element(split(",", var.mgr_asg_azs),1)}","${element(split(",", var.mgr_asg_azs),2)}"]

	max_size = "${var.mgr_asg_max_size}"
	min_size = "${var.mgr_asg_min_size}"
	health_check_grace_period = 300
	health_check_type = "EC2"
	desired_capacity  = "${var.mgr_asg_desired_capacity}"
	force_delete = true

	tag {
		key   = "Name"
		value = "${var.cluster_name}-manager-node"
		propagate_at_launch = true
	}
}

resource "template_file" "wkr_user_data_tpl" {
	template = "${file(var.worker_user_data_file)}"

	vars {
		NODE_REG_SECRET_TOKEN = "${var.node_reg_secret_token}"
		MGR_HOST_IP = "${aws_instance.cluster_init_instance.private_ip}"
	}
}

resource "aws_launch_configuration" "swarm-worker-node-launch-configuration" {
	name = "${var.cluster_name}-worker-launch-configuration"

	image_id = "${var.node_ami_id}"
	instance_type ="${var.node_wkr_ec2_type}"
	iam_instance_profile = "${aws_iam_instance_profile.swarm-instance-profile.name}"

	user_data = "${template_file.wkr_user_data_tpl.rendered}"
	security_groups = ["${aws_security_group.swarm-instance-security-group.id}","${aws_security_group.worker-node-security-group.id}"]
	key_name = "${var.node_ec2_keypair}"

	depends_on = ["aws_iam_instance_profile.swarm-instance-profile","aws_instance.cluster_init_instance"]
}

resource "aws_autoscaling_group" "worker-node-autoscaling-group" {
	name = "${var.cluster_name}-worker-autoscaling-group"

	launch_configuration = "${aws_launch_configuration.swarm-worker-node-launch-configuration.name}"

	#vpc_zone_identifier = ["${split(",", var.wkr_asg_subnet_ids)}"]
	#availability_zones  = ["${split(",", var.wkr_asg_azs)}"]
	vpc_zone_identifier = ["${element(split(",", var.wkr_asg_subnet_ids),3)}","${element(split(",", var.wkr_asg_subnet_ids),4)}","${element(split(",", var.wkr_asg_subnet_ids),5)}"]
	availability_zones  = ["${element(split(",", var.wkr_asg_azs),3)}","${element(split(",", var.wkr_asg_azs),4)}","${element(split(",", var.wkr_asg_azs),5)}"]


	max_size = "${var.wkr_asg_max_size}"
	min_size = "${var.wkr_asg_min_size}"
	health_check_grace_period = 300
	health_check_type = "EC2"
	desired_capacity  = "${var.wkr_asg_desired_capacity}"
	force_delete = true

	tag {
		key   = "Name"
		value = "${var.cluster_name}-worker-node"
		propagate_at_launch = true
	}
}


# Outputs

output "cluster_instance_sg_id" { value = "${aws_security_group.swarm-instance-security-group.id}"}