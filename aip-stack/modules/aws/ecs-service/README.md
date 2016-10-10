# ecs-service module  
# -------------------------------------  
  
This module creates an ecs service. This stack consists of :  
   -  ECS Service, Task, IAM role  
   -  ELB to the Service instances  
   -  DNS record to the Service  
  
# Inputs    
  
  
For ECS Service, Task:  
  
ecs_service_name     - Name of the ecs service to be created  
ecs_task_name        - Name of the task to be associated to the service  
task_definition_file - Path to the file containing task definition  
  
ecs_cluser_id              - Id of the ecs cluster where service to be deployed  
ecs_service_desired_count  - Desired count of the ecs service containers, default value 1  
ecs_service_container_name - Container name as mentioned in the task definition file, default value "nginx"  
ecs_service_container_port - Container port as mentioned in the task definition file, default value 80  
  
For load balancer to the ECS Service:  
  
vpc_id     - VPC id where cluster instances to be created  
subnet_ids - Subnet ids in the vpc where cluster instances to be created  
  
ecs_service_elb_listener_instance_port     - Load balancer's listener instance port  
ecs_service_elb_listener_instance_protocol - Load balancer's listener instance protocol, default value "http"  
ecs_service_elb_listener_lb_port           - Load balancer's listener elb port, default value 443  
ecs_service_elb_listener_lb_protocol       - Load balancer's listener elb protocol, default value "https"  
  
ecs_service_elb_ssl_cert_arn               - Service's SSL certificate arn  
  
ecs_service_elb_healthy_threshold          - ELB health check, healthy threshold, default value 2  
ecs_service_elb_unhealthy_threshold        - ELB health check, unhealthy threshold, default value 2  
ecs_service_elb_health_check_timeout       - ELB health check, health check timeout, default value 3  
ecs_service_elb_health_check_url           - ELB health check, health check url  
ecs_service_elb_health_check_interval      - ELB health check, health check interval, default value 30  
  
ecs_service_elb_sec_group_ing_from_port    - ELB security group - ingress port range beginning from, default value 443  
ecs_service_elb_sec_group_ing_to_port      - ELB security group - ingress port range ends at, default value 443  
ecs_service_elb_sec_group_ing_protocol     - ELB security group - ingress protocol, default value "tcp"  
ecs_service_elb_sec_group_ing_cidr_blocks  - ELB security group - ingress cidr blocks, default value "0.0.0.0/0"  
ecs_service_elb_sec_group_eg_from_port     - ELB security group - egress port range beginning from, default value 0  
ecs_service_elb_sec_group_eg_to_port       - ELB security group - egress port range ends at, default value 0  
ecs_service_elb_sec_group_eg_protocol      - ELB security group - egress protocol, default value "-1"  
ecs-service-instance-security-group-id     - ECS cluster instance's security group id  
  
  
Service DNS Record:  
  
ecs_service_dns_zone_id - Zone id where ecs service dns record to be created  
ecs_service_dns_name    - Domain name of the service  
  
  
# Outputs  
  
service_name - Name of the ECS service created  
  
  
  
# Usage  
  
module "test_ecs_service" {  
	  
	source = "../../../modules/aws/ecs-service"  
  
	ecs_cluser_id        = "${module.ecs.cluster_id}"                    # gets cluster id from ecs_cluster module  
  
	ecs_service_name     = "${var.adm_ecs_service_test_service_name}"    # define service name in .tfvars file  
	ecs_task_name        = "${var.adm_ecs_service_test_task_name}"       # define task name in .tfvars file  
	task_definition_file = "${var.adm_ecs_service_test_task_definition_file}"   # define path to task definition file in .tfvars file  
  
	vpc_id         = "${var.adm_vpc_id}"                                 # gets vpc id from vpc module or .tfvars file  
	subnet_ids     = "${module.vpc.subnet_ids}"                          # gets subnet ids from vpc module  
  
	ecs_service_elb_listener_instance_port     = "${var.adm_ecs_service_test_elb_listener_instance_port}" # define instance port for the service in .tfvars file  
	ecs_service_elb_ssl_cert_arn               = "${var.adm_ecs_service_test_elb_ssl_cert_arn}"           # define SSL certificate arn in .tfvars file  
  
	ecs_service_elb_health_check_url      = "${var.adm_ecs_service_test_elb_health_check_url}"            # define elb health check url for the service in .tfvars file  
  
	ecs-service-instance-security-group-id  = "${module.ecs.cluster_instance_sg_id}"                      # gets ecs cluster instances security group id from ecs module  
  
	ecs_service_dns_zone_id = "${var.adm_ecs_service_zone_id}"         # define service's dns records zone id in .tfvars file  
	ecs_service_dns_name    = "${var.adm_ecs_service_test_dns_name}"   # define service's dns name in .tfvars file  
  
}