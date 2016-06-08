# Admin VPC ECS Cluster Subnets


# Variables

variable "adm_vpc_id"                       { }
variable "adm_vpc_az1"                      { }
variable "adm_vpc_az2"                      { }
variable "adm_vpc_private_route_table_id"   { }
variable "adm_vpc_ecs_subnet_az1_cidr"      { }
variable "adm_vpc_ecs_subnet_az2_cidr"      { }


# Resources

resource "aws_subnet" "aip-adm-sn-private-ecs-az1" {
    vpc_id = "${var.adm_vpc_id}"
    cidr_block = "${var.adm_vpc_ecs_subnet_az1_cidr}"
    availability_zone = "${var.adm_vpc_az1}"

    tags {
        Name = "aip-adm-sn-private-ecs-${var.adm_vpc_az1}"
    }
}

resource "aws_subnet" "aip-adm-sn-private-ecs-az2" {
    vpc_id = "${var.adm_vpc_id}"
    cidr_block = "${var.adm_vpc_ecs_subnet_az2_cidr}"
    availability_zone = "${var.adm_vpc_az2}"

    tags {
        Name = "aip-adm-sn-private-ecs-${var.adm_vpc_az2}"
    }
}


# Route Table Subnet Associations

resource "aws_route_table_association" "rtbl_assoc_1" {
    subnet_id = "${aws_subnet.aip-adm-sn-private-ecs-az1.id}"
    route_table_id = "${var.adm_vpc_private_route_table_id}"
}

resource "aws_route_table_association" "rtbl_assoc_2" {
    subnet_id = "${aws_subnet.aip-adm-sn-private-ecs-az2.id}"
    route_table_id = "${var.adm_vpc_private_route_table_id}"
}


output "subnet_ids" { value = "${aws_subnet.aip-adm-sn-private-ecs-az1.id},${aws_subnet.aip-adm-sn-private-ecs-az2.id}" }