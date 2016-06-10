
/*
 * TF module to create an ecs service
 */

variable "ecs_service_name" {
	description = "name of the ecs service"
}

variable "ecs_task_name" {
	description = "name of the task associated to the service"
}

variable "task_definition_file" {
	description = "task defintion file path"
}

variable "ecs_cluser_id" {
	description = "id of the ecs cluster where service to be deployed"
}

variable "ecs_service_desired_count" {
	description = "desired count of the ecs service containers"
}

/*
variable "ecs_service_elb_name" {
	description = "ecs_service_elb_name"
}

variable "ecs_service_container_name" {
	description = "ecs_service_container_name"
}

variable "ecs_service_container_port" {
	description = "ecs_service_container_port"
}
*/

/*
 * ECS task definition
 */

resource "aws_ecs_task_definition" "ecs_task" {
	family = "${var.ecs_task_name}"
	container_definitions = "${file(var.task_definition_file)}"
}

/*
 * ECS Service defintion
 */

resource "aws_ecs_service" "ecs_service" {
	name = "${var.ecs_service_name}"

	cluster = "${var.ecs_cluser_id}"
	task_definition = "${aws_ecs_task_definition.ecs_task.arn}"
	desired_count   = "${var.ecs_service_desired_count}"

	#load_balancer {
	#	elb_name = "${var.ecs_service_elb_name}"
	#	container_name = "${var.ecs_service_container_name}"
	#	container_port = "${var.ecs_service_container_port}"
	#}
}