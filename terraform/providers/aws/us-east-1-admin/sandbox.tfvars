# Variables
	
region = "us-east-1"


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


# ECS Cluster

# must mention the below cluster name in the user-data-file too
adm_ecs_cluster_name = "aip-adm-ecs-admin"

adm_ecs_cluster_ami_id        = "ami-8f7687e2"
adm_ecs_cluster_instance_type = "t2.micro"
adm_ecs_cluster_ec2_keypair   = "aip-bi-adm-keys"
adm_ecs_cluster_ec2_userdata  = "ecs-cluster-user-data.txt"

adm_ecs_cluster_autoscale_max     = 2
adm_ecs_cluster_autoscale_min     = 1
adm_ecs_cluster_autoscale_desired = 1
