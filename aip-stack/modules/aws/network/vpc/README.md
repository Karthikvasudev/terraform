# vpc module  
# -------------------------------------  
  
This module creates 2 subnets and their route tables in different availability zones where ECS cluster launches its instances.  
  
# Inputs  
  
# Variables  
  
adm_vpc_id  - VPC Id where subnets to be added  
adm_vpc_az1 - Availability zone 1 for subnet 1 to be created  
adm_vpc_az2 - Availability zone 1 for subnet 2 to be created  
adm_vpc_private_route_table_id - Private route table id where routing to the subnets to be configured  
adm_vpc_ecs_subnet_az1_cidr - CIDR block for subnet 1  
adm_vpc_ecs_subnet_az2_cidr - CIDR block for subnet 2  
  
# Output  
  
subnet_ids - Id of the subnets created in the VPC  
  
# Usage  
  
module "vpc" {  
  
	source = "../../../modules/aws/network/vpc"  
  
	# Admin VPC Id  
	adm_vpc_id = "${var.adm_vpc_id}"  
  
	# CIDR block assignments  
	adm_vpc_ecs_subnet_az1_cidr = "${var.adm_vpc_ecs_subnet_az1_cidr}"  
	adm_vpc_ecs_subnet_az2_cidr = "${var.adm_vpc_ecs_subnet_az2_cidr}"  
  
	# Subnet AZ assignments  
	adm_vpc_az1 = "${var.adm_vpc_az1}"  
	adm_vpc_az2 = "${var.adm_vpc_az2}"  
  
	# Admin VPC Route Table Id  
	adm_vpc_private_route_table_id = "${var.adm_vpc_private_route_table_id}"  
  
}