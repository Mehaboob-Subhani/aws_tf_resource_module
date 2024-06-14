provider "aws" {
  region = "us-east-1"  # Change the region accordingly
}

resource "aws_s3_bucket" "accout_name_S3" {
  count         = "${length(var.bucket_names)}"
  bucket        = "${element(var.bucket_names, count.index)}"

  # count         = length(local.bucket_names)
  # bucket        = local.bucket_names[count.index]
  force_destroy = "false"


  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}