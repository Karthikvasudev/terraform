# ecs module
# ----------

This module creates an ecs cluster and adds ec2 instances with proper iam role to the cluster. It also associates an autoscaling group and sets up instance security group to the cluster instances.

# Inputs:

cluster_name - Name of the ecs cluster to be created

ami_id         - Amazon linux ecs optimized ami id to be used to create cluster instance 
instance_type  - Cluster instance type to be provisioned
keypair_name   - Keypair name to be used for cluster instance
user_data_file - File containing user-data attribute of the ec2 instace. Mention cluster_name value in user-data file

vpc_id     - VPC id where cluster instances to be created
subnet_ids - Subnet ids in the vpc where cluster instances to be created
azs        - Availability zones where cluster instances to be created

as_max_size         - maximum number of instances in the cluster, default value 2
as_min_size         - minimum number of instances in the cluster, default value 1
as_desired_capacity - desired number of instances in the cluster, default value 1

vpc_nat_instance_sg - Security group associated to VPC's nat instance

ecs_instance_sec_group_ing_from_port - Cluster instance security group - ingress from port, default value 22
ecs_instance_sec_group_ing_to_port   - Cluster instance security group - ingress to port, default value 22
ecs_instance_sec_group_ing_protocol  - Cluster instance security group - ingress protocol, default value "tcp"
ecs_instance_sec_group_ingress_cidrs - Cluster instance security group - ingress cidr blocks
ecs_instance_sec_group_eg_from_port  - Cluster instance security group - egress from_port, default value 0
ecs_instance_sec_group_eg_to_port    - Cluster instance security group - egrss  to_port, default value 0
ecs_instance_sec_group_eg_protocol   - Cluster instance security group - egress protocol, default value "-1"

# Outputs

cluster_id  - Id of the ecs cluster created
cluster_instance_sg_id - Id of the security group associated to the cluster instances


# Usage

module "ecs" {
	source = "../../../modules/aws/ecs"

	cluster_name  = "${var.adm_ecs_cluster_name}"              # define cluster name in .tfvars file
	
	# EC2 instance in the Cluster
	ami_id         = "${var.adm_ecs_cluster_ami_id}"           # define ami id in .tfvars file
	instance_type  = "${var.adm_ecs_cluster_instance_type}"    # define instance type in .tfvars file
	keypair_name   = "${var.adm_ecs_cluster_ec2_keypair}"      # define keypair name in .tfvars file
	user_data_file = "${var.adm_ecs_cluster_ec2_userdata}"     # define path to user-data file in .tfvars file 

	vpc_id         = "${var.adm_vpc_id}"                       # gets vpc id from the vpc module, of define in .tfvars
	subnet_ids     = "${module.vpc.subnet_ids}"                # gets subnet ids from vpc module
	azs            = "${var.adm_vpc_az1},${var.adm_vpc_az2}"   # define azs in .tfvars file

	# VPC nat instance Security Group id
	vpc_nat_instance_sg = "${var.adm_vpc_nat_sg}"              # define vpc's nat instance security group id in .tfvars file

	ecs_instance_sec_group_ingress_cidrs = "10.85.0.0/16"      # define network cidr blocks from where cluster instance SSH access to be allowed
}