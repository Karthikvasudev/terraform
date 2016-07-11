/*
 * TF configuration to create resources required for bis stack like rds,s3,sqs,sns
 */

variable "region" 	 { default = "us-east-1" }
variable "accountno" { }
variable "env"       { }

variable "profile" 	 { default = "default" }

provider "aws" {
	profile = "${var.profile}"
	region  = "${var.region}"
}

# LTS Terraform State - Remote Storage Backend configuration
resource "terraform_remote_state" "s3-remote-state" {
	backend = "s3"
	config {
		bucket  = "aip-config-${var.region}-${var.accountno}"
		key     = "terraform/bis-${var.env}-${var.region}/bis-${var.env}-${var.region}.tfstate"
		region  = "${var.region}"
		profile = "${var.profile}"
	}
}

# Log groups for aip

module "aip-log-groups" {
	source = "../../../modules/aws/awslogs"

	region  = "${var.region}"
	profile = "${var.profile}"
	log-group-names = "aip-${var.env}-proxy-nginx,aip-${var.env}-server-app-web,aip-${var.env}-authentication-service,aip-${var.env}-application-service,aip-${var.env}-organization-service,aip-${var.env}-email-service"
}

# Log groups for aip-chronos

module "aip-chronos-log-groups" {
	source = "../../../modules/aws/awslogs"

	region  = "${var.region}"
	profile = "${var.profile}"
	log-group-names = "aip-${var.env}-chronos-service"
}

# Log group for aip-proxy

module "aip-proxy-log-groups" {
	source = "../../../modules/aws/awslogs"

	region  = "${var.region}"
	profile = "${var.profile}"
	log-group-names = "aip-${var.env}-proxy-nginx-plus"
}

# Log group for bi

module "bi-log-groups" {
	source = "../../../modules/aws/awslogs"

	region  = "${var.region}"
	profile = "${var.profile}"
	log-group-names = "bi-${var.env}-proxy-nginx,bi-${var.env}-dataaccess-service,bi-${var.env}-server-app-web"
}

# Log group for bi-datapipeline

module "bi-datapipeline-groups" {
	source = "../../../modules/aws/awslogs"

	region  = "${var.region}"
	profile = "${var.profile}"
	log-group-names = "bi-${var.env}-datapipeline-service"
}

# Log group for bi-dataprocess

module "bi-dataprocess-groups" {
	source = "../../../modules/aws/awslogs"

	region  = "${var.region}"
	profile = "${var.profile}"
	log-group-names = "bi-${var.env}-dataprocess-service"
}	