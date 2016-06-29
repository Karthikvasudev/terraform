# Variables
	
region    = "us-east-1"
accountno = "661072482170"
env       = "admin-prod-us1"


# Admin VPC Id
adm_vpc_id = "vpc-1d23ee79"

# CIDR block assignments
adm_vpc_ecs_subnet_az1_cidr = "10.85.4.0/25"
adm_vpc_ecs_subnet_az2_cidr = "10.85.4.128/25"

# Subnet AZ assignments
adm_vpc_az1 = "us-east-1d"
adm_vpc_az2 = "us-east-1e"

# Admin VPC Route Table Id
adm_vpc_private_route_table_id = "rtb-1942f17d"

adm_vpc_nat_sg = "sg-f37b7794"

# Admin S3 bucket

adm_bucket_name = "aip-adm-s3-app-data"

# ECS Cluster

# must mention the below cluster name in the user-data-file too
adm_ecs_cluster_name = "aip-adm-ecs-admin"

adm_ecs_cluster_ami_id        = "ami-8f7687e2"
adm_ecs_cluster_instance_type = "m3.large"
adm_ecs_cluster_ec2_keypair   = "aip-bi-adm-keys"
adm_ecs_cluster_ec2_userdata  = "./admin/admin-prod-us1/ecs-cluster-user-data.txt"

adm_ecs_cluster_autoscale_max     = 2
adm_ecs_cluster_autoscale_min     = 2
adm_ecs_cluster_autoscale_desired = 2

adm_ecs_service_zone_id       = "ZWNUK1RZNC5G5"


# ECS Service - Jira

adm_ecs_service_jira_service_name         = "aip-adm-jira"
adm_ecs_service_jira_task_name            = "jira"
adm_ecs_service_jira_task_definition_file = "./admin/admin-prod-us1/jira-task-definition.json"


adm_ecs_service_jira_elb_listener_instance_port     = 8000

adm_ecs_service_jira_elb_ssl_cert_arn = "arn:aws:acm:us-east-1:661072482170:certificate/cb98db69-6fc9-452a-b4c2-fd8c437b8bc5"

adm_ecs_service_jira_elb_health_check_url      = "TCP:8000"

adm_ecs_service_jira_dns_name = "jira.aipadmin.com"



# ECS Service - Confluence

adm_ecs_service_confluence_service_name         = "aip-adm-confluence"
adm_ecs_service_confluence_task_name            = "confluence"
adm_ecs_service_confluence_task_definition_file = "./admin/admin-prod-us1/confluence-task-definition.json"


adm_ecs_service_confluence_elb_listener_instance_port     = 8001

adm_ecs_service_confluence_elb_ssl_cert_arn = "arn:aws:acm:us-east-1:661072482170:certificate/cb98db69-6fc9-452a-b4c2-fd8c437b8bc5"

adm_ecs_service_confluence_elb_health_check_url      = "TCP:8001"

adm_ecs_service_confluence_dns_name = "confluence.aipadmin.com"


# ECS Service - bitbucket

adm_ecs_service_bitbucket_service_name         = "aip-adm-bitbucket"
adm_ecs_service_bitbucket_task_name            = "bitbucket"
adm_ecs_service_bitbucket_task_definition_file = "./admin/admin-prod-us1/bitbucket-task-definition.json"


adm_ecs_service_bitbucket_elb_listener_instance_port     = 8002

adm_ecs_service_bitbucket_elb_ssl_cert_arn = "arn:aws:acm:us-east-1:661072482170:certificate/cb98db69-6fc9-452a-b4c2-fd8c437b8bc5"

adm_ecs_service_bitbucket_elb_health_check_url      = "TCP:8002"

adm_ecs_service_bitbucket_dns_name = "bitbucket.aipadmin.com"
