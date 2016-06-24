# Variables
	
region    = "us-east-1"
accountno = "596978647277"
env       = "admin-dev-us1"


# Admin VPC Id
adm_vpc_id = "vpc-8b20eaef"

# CIDR block assignments
adm_vpc_ecs_subnet_az1_cidr = "10.85.4.0/25"
adm_vpc_ecs_subnet_az2_cidr = "10.85.4.128/25"

# Subnet AZ assignments
adm_vpc_az1 = "us-east-1b"
adm_vpc_az2 = "us-east-1c"

# Admin VPC Route Table Id
adm_vpc_private_route_table_id = "rtb-2c3a8248"

adm_vpc_nat_sg = "sg-e25b4685"


# ECS Cluster

# must mention the below cluster name in the user-data-file too
adm_ecs_cluster_name = "aip-adm-ecs-admin"

adm_ecs_cluster_ami_id        = "ami-8f7687e2"
adm_ecs_cluster_instance_type = "m3.large"
adm_ecs_cluster_ec2_keypair   = "aip-bi-adm-keys-infradev"
adm_ecs_cluster_ec2_userdata  = "./admin/admin-dev-us1/ecs-cluster-user-data.txt"

adm_ecs_cluster_autoscale_max     = 2
adm_ecs_cluster_autoscale_min     = 2
adm_ecs_cluster_autoscale_desired = 2

adm_ecs_service_zone_id       = "Z2TRK11Z2S58FH"

# ECS Service - Jira

adm_ecs_service_jira_service_name         = "aip-adm-jira"
adm_ecs_service_jira_task_name            = "jira"
adm_ecs_service_jira_task_definition_file = "./admin/admin-prod-us1/jira-task-definition.json"


adm_ecs_service_jira_elb_listener_instance_port     = 8000

adm_ecs_service_jira_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_jira_elb_health_check_url      = "TCP:8000"

adm_ecs_service_jira_dns_name = "jira.aipadmin.com"



# ECS Service - Confluence

adm_ecs_service_confluence_service_name         = "aip-adm-confluence"
adm_ecs_service_confluence_task_name            = "confluence"
adm_ecs_service_confluence_task_definition_file = "./admin/admin-prod-us1/confluence-task-definition.json"


adm_ecs_service_confluence_elb_listener_instance_port     = 8001

adm_ecs_service_confluence_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_confluence_elb_health_check_url      = "TCP:8001"

adm_ecs_service_confluence_dns_name = "confluence.aipadmin.com"