provider "aws" { }

variable "aws_account_id" {}
variable "aws_region" {}
variable "az_names" { default = [] }

resource "aws_s3_bucket" "remote_state" {
  bucket = "${var.bucket_remote_state}"
  acl = "private"

  versioning {
    enabled = true
  }

  tags {
    "Provisioner" = "tf"
  }
}

output "bucket_remote_state" {
  value = "${var.bucket_remote_state}"
}

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "aws_region" {
  value = "${var.aws_region}"
}

output "az_count" {
  value = "${length(var.az_names)}"
}

output "az_names" {
  value = "${var.az_names}"
}
