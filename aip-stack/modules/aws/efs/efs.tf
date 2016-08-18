/*
 * TF configuration to create an EFS
 */

# Variables

variable "efs_name" {
    description = "name of the efs service"
}

variable "subnet_ids" {
    description = "subnet ids in the vpc where instances created"
}

variable "vpc_id" {
    description = "vpc_id in the vpc where instances created"
}

# Resources

resource "aws_efs_file_system" "efs" {
  
  tags {
    Name = "${var.efs_name}"
  }
}

resource "aws_security_group" "efs-instance-security-group" {
	name = "${var.efs_name}-instance-sg"
	description = "Sec group associated to ${var.efs_name} instance"
	vpc_id = "${var.vpc_id}"

	tags {
		Name = "${var.efs_name}-instance-sg"
	}
}

resource "aws_efs_mount_target" "efs-mount-az1" {
  file_system_id = "${aws_efs_file_system.efs.id}"
  security_groups = ["${aws_security_group.efs-instance-security-group.id}"]
  subnet_id = "${element(split(",", var.subnet_ids), 0)}"
}

resource "aws_efs_mount_target" "efs-mount-az2" {
  file_system_id = "${aws_efs_file_system.efs.id}"
  security_groups = ["${aws_security_group.efs-instance-security-group.id}"]
  subnet_id = "${element(split(",", var.subnet_ids), 1)}"
}

output "efs_sg_id" { value = "${aws_security_group.efs-instance-security-group.id}"}

