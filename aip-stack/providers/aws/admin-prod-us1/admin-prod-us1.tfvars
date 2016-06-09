# Variables
	
region = "us-east-1"


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


# ELB Test

adm_test_elb_name = "test-elb"

adm_elb_test_listener_instance_port     = 8001
adm_elb_test_listener_instance_protocol = "http"
adm_elb_test_listener_lb_port           = 443
adm_elb_test_listener_lb_protocol       = "https"

adm_elb_test_elb_ssl_cert_arn      = "arn:aws:acm:us-east-1:661072482170:certificate/cb98db69-6fc9-452a-b4c2-fd8c437b8bc5"

adm_elb_test_elb_healthy_threshold      = 2
adm_elb_test_elb_unhealthy_threshold    = 2
adm_elb_test_elb_health_check_timeout   = 3
adm_elb_test_elb_health_check_url       = "HTTPS:443/"
adm_elb_test_elb_health_check_interval  = 30


# ECS Cluster

# must mention the below cluster name in the user-data-file too
adm_ecs_cluster_name = "aip-adm-ecs-admin"

adm_ecs_cluster_ami_id        = "ami-8f7687e2"
adm_ecs_cluster_instance_type = "t2.micro"
adm_ecs_cluster_ec2_keypair   = "aip-bi-adm-keys"
adm_ecs_cluster_ec2_userdata  = "./admin-prod-us1/ecs-cluster-user-data.txt"

adm_ecs_cluster_autoscale_max     = 2
adm_ecs_cluster_autoscale_min     = 1
adm_ecs_cluster_autoscale_desired = 1
