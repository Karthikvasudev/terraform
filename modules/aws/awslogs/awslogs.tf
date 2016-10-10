/*
 * TF module to create log group in CloudWatch
 */

variable "region" {
	type = "string"
	description = "region where resouce to be created"
}

variable "profile" {
	type = "string"
	description = "aws user profile to be used to authenticate"
}

variable "log-group-names" {
	type = "string"
	description = "describe your variable"
}

resource "null_resource" "awslogs" {
	count = "${length(split(",", var.log-group-names))}"

	provisioner "local-exec" {
		command = "aws --region ${var.region} --profile ${var.profile} logs create-log-group --log-group-name ${element(split(",", var.log-group-names),count.index)}"
	}
}