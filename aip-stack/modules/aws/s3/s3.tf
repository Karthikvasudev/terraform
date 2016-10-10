/*
 * TF configuration to create an S3 bucket
 */

# Variables

variable "bucket_name" {
    description = "name of the S3 bucket"
}

variable "region" {
    description = "S3 bucket region"
}

variable "accountno" {
    description = "AWS account number"
}

variable "profile" {
    description = "AWS account profile"
}

variable "localpath" {
    description = "s3 source local path"
}

# Resources

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "${var.bucket_name}-${var.region}-${var.accountno}"
    region = "${var.region}"

	provisioner "local-exec" {
		command = "aws --region ${var.region} --profile ${var.profile} s3 sync ${var.localpath} s3://${var.bucket_name}-${var.region}-${var.accountno}"
	}
	lifecycle_rule {
        id = "move-backups-glacier"
        prefix = "backups/"
        enabled = true

        transition {
            days = 7
            storage_class = "GLACIER"
        }
        expiration {
            days = 60
        }
    }

}
