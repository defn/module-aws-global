provider "aws" { }

variable "aws_account_id" {}
variable "aws_region" {}
variable "az_names" { default = [] }
variable "vpc_domain" {}

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

resource "aws_route53_zone" "domain" {
  name = "${var.vpc_domain}"
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

output "vpc_domain" {
  value = "${var.vpc_domain}"
}

output "zone_id" {
  value = "${aws_route53_zone.domain.zone_id}"
}

output "zone_name_servers" {
  value = "${aws_route53_zone.domain.name_servers}"
}
