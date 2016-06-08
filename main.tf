provider "aws" {
  region = "${var.provider_region}"
}

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