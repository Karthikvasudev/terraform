# N. Virginia us-east-1 Admin VPC

variable "region" { }

variable "profile" {
	default = "default"
}

provider "aws" {
    profile = "${var.profile}"
	region = "${var.region}"
}

module "vpc" {

	source = "../../../../modules/vpc"

}




