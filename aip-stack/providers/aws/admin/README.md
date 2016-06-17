
# TF configuration for admin infrastructure
# -----------------------------------------

Creates admin stack consisting of admin VPC, ECS Cluster and ECS services for Jira, Jenkins, BitBucket etc.

# Inputs

VPC :

adm_vpc_id            - vpc id (if working on existing vpc), or VPC module should return this value
adm_vpc_az1           - Availability zone 1 in admin vpc
adm_vpc_az2           - Availability zone 2 in admin vpc
adm_vpc_private_route_table_id  - If of the private route table in VPC
adm_vpc_ecs_subnet_az1_cidr - CIDR block of the subnet in availability zone 1
adm_vpc_ecs_subnet_az2_cidr - CIDR block of the subnet in availability zone 2
adm_vpc_nat_sg        - Security group id associated to the VPC's NAT instance


ECS Cluster:

adm_ecs_cluster_name          - Name of the admin cluster to be created
adm_ecs_cluster_ami_id        - ECS optimized amazon Linux ami id specific to the region
adm_ecs_cluster_instance_type - Type of the EC2 instance to be created in the ECS cluster
adm_ecs_cluster_ec2_keypair   - Name of the key pair for cluster instance access
adm_ecs_cluster_ec2_userdata  - Path to the user-data file for the cluster instance

 
ECS Service - Jira:

adm_ecs_service_jira_service_name  - Name the jira service for a given environment
adm_ecs_service_jira_task_name     - Name of the jira task name
adm_ecs_service_jira_task_definition_file - Path to the task definition file for the jira service

adm_ecs_service_jira_elb_listener_instance_port - Port in the cluster instance where the service listens
adm_ecs_service_jira_elb_ssl_cert_arn           - arn of the SSL certificate to be used for this service
adm_ecs_service_jira_elb_health_check_url       - Health check URL for this service to be used by ELB

adm_ecs_service_zone_id       - Route53 zone id where dns record for this service to be created
adm_ecs_service_jira_dns_name - DNS name of this service


# Outputs

None

# Usage

For each of the ECS service to be launched in the Admin cluster, use the 'ecs-service' module as shown below to launch its infrastructure. Also declare their variables in the Variables section of the admin.tf file.

Values to the input parameters should be provided in the .tfvars file maintained in the respective environment specific directories.

Each of the service should have its task definition file and user-data file in the respective environment directories.

module "test_ecs_service" {
	
	source = "../../../modules/aws/ecs-service"

	ecs_cluser_id        = "${module.ecs.cluster_id}"

	ecs_service_name     = "${var.adm_ecs_service_test_service_name}"
	ecs_task_name        = "${var.adm_ecs_service_test_task_name}"
	task_definition_file = "${var.adm_ecs_service_test_task_definition_file}"

	vpc_id         = "${var.adm_vpc_id}"
	subnet_ids     = "${module.vpc.subnet_ids}"

	ecs_service_elb_listener_instance_port  = "${var.adm_ecs_service_test_elb_listener_instance_port}"
	ecs_service_elb_ssl_cert_arn            = "${var.adm_ecs_service_test_elb_ssl_cert_arn}"
	ecs_service_elb_health_check_url        = "${var.adm_ecs_service_test_elb_health_check_url}"
	ecs-service-instance-security-group-id  = "${module.ecs.cluster_instance_sg_id}"

	ecs_service_dns_zone_id = "${var.adm_ecs_service_zone_id}"
	ecs_service_dns_name    = "${var.adm_ecs_service_test_dns_name}"

}