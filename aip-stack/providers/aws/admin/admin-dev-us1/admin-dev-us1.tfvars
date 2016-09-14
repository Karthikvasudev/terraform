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

# Admin S3 bucket

adm_bucket_name = "aip-adm-s3-app-data"

# EFS

adm_efs_name = "aip-adm-efs-admin"

# ECS Cluster

# must mention the below cluster name in the user-data-file too
adm_ecs_cluster_name = "aip-adm-ecs-admin"

adm_ecs_cluster_ami_id        = "ami-8f7687e2"
adm_ecs_cluster_instance_type = "c4.xlarge"
adm_ecs_cluster_ec2_keypair   = "aip-bi-adm-keys-infradev"
adm_ecs_cluster_ec2_userdata  = "./admin/admin-dev-us1/ecs-cluster-user-data.txt"

adm_ecs_cluster_autoscale_max     = 3
adm_ecs_cluster_autoscale_min     = 3
adm_ecs_cluster_autoscale_desired = 3

adm_ecs_service_zone_id       = "Z2TRK11Z2S58FH"
adm_apps_ecs_service_zone_id  = "Z2TRK11Z2S58FH"


# ECS Service - Jira

adm_ecs_service_jira_service_name         = "aip-adm-jira"
adm_ecs_service_jira_task_name            = "jira"
adm_ecs_service_jira_task_definition_file = "./admin/admin-dev-us1/jira-task-definition.json"


adm_ecs_service_jira_elb_listener_instance_port     = 8000

adm_ecs_service_jira_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_jira_elb_health_check_url      = "TCP:8000"

adm_ecs_service_jira_dns_name = "jira.aipadmin.com"



# ECS Service - Confluence

adm_ecs_service_confluence_service_name         = "aip-adm-confluence"
adm_ecs_service_confluence_task_name            = "confluence"
adm_ecs_service_confluence_task_definition_file = "./admin/admin-dev-us1/confluence-task-definition.json"


adm_ecs_service_confluence_elb_listener_instance_port     = 8001

adm_ecs_service_confluence_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_confluence_elb_health_check_url      = "TCP:8001"

adm_ecs_service_confluence_dns_name = "confluence.aipadmin.com"


# ECS Service - bitbucket

adm_ecs_service_bitbucket_service_name         = "aip-adm-bitbucket"
adm_ecs_service_bitbucket_task_name            = "bitbucket"
adm_ecs_service_bitbucket_task_definition_file = "./admin/admin-dev-us1/bitbucket-task-definition.json"


adm_ecs_service_bitbucket_elb_listener_instance_port     = 8002

adm_ecs_service_bitbucket_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_bitbucket_elb_health_check_url      = "TCP:8002"

adm_ecs_service_bitbucket_dns_name = "bitbucket.aipadmin.com"


# ECS Service - Artifactory

adm_ecs_service_artifactory_service_name         = "aip-adm-artifactory"
adm_ecs_service_artifactory_task_name            = "artifactory"
adm_ecs_service_artifactory_task_definition_file = "./admin/admin-dev-us1/artifactory-task-definition.json"


adm_ecs_service_artifactory_elb_listener_instance_port     = 8003

adm_ecs_service_artifactory_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_artifactory_elb_health_check_url      = "TCP:8003"

adm_ecs_service_artifactory_dns_name = "artifactory.aipadmin.com"


# ECS Service - Jenkins

adm_ecs_service_jenkins_service_name         = "aip-adm-jenkins"
adm_ecs_service_jenkins_task_name            = "jenkins"
adm_ecs_service_jenkins_task_definition_file = "./admin/admin-dev-us1/jenkins-task-definition.json"


adm_ecs_service_jenkins_elb_listener_instance_port     = 8004

adm_ecs_service_jenkins_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_jenkins_elb_health_check_url      = "TCP:8004"

adm_ecs_service_jenkins_dns_name = "jenkins.aipadmin.com"


# ECS Service - blast

adm_ecs_service_blast_service_name         = "aip-adm-blast"
adm_ecs_service_blast_task_name            = "blast"
adm_ecs_service_blast_task_definition_file = "./admin/admin-dev-us1/blast-task-definition.json"


adm_ecs_service_blast_elb_listener_instance_port     = 8005

adm_ecs_service_blast_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_blast_elb_health_check_url      = "TCP:8005"

adm_ecs_service_blast_dns_name = "blast.aipadmin.com"


# ECS Service - crowd

adm_ecs_service_crowd_service_name         = "aip-adm-crowd"
adm_ecs_service_crowd_task_name            = "crowd"
adm_ecs_service_crowd_task_definition_file = "./admin/admin-dev-us1/crowd-task-definition.json"


adm_ecs_service_crowd_elb_listener_instance_port     = 8006

adm_ecs_service_crowd_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_crowd_elb_health_check_url      = "TCP:8006"

adm_ecs_service_crowd_dns_name = "crowd.aipadmin.com"


# ECS Service - bio

adm_ecs_service_bio_service_name         = "aip-adm-bio"
adm_ecs_service_bio_task_name            = "bio"
adm_ecs_service_bio_task_definition_file = "./admin/admin-dev-us1/bio-task-definition.json"


adm_ecs_service_bio_elb_listener_instance_port     = 8007

adm_ecs_service_bio_elb_ssl_cert_arn = "arn:aws:iam::596978647277:server-certificate/aipadmin"

adm_ecs_service_bio_elb_health_check_url      = "TCP:8007"

adm_ecs_service_bio_dns_name = "bio.aipadmin.com"