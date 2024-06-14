# #s3 bucket import
# resource "aws_s3_bucket" "s3_bucket" {
#   for_each = var.buckets

#   bucket = each.value
#   # Add other bucket configurations as needed
# }

provider "aws" {
  region = "us-east-1"  # Change the region accordingly
}

resource "aws_s3_bucket" "accout_name_S3" {
  for_each      = { for data in var.buckets : data.bucket_name => data }
  bucket = each.value.bucket_name
  
  # count         = length(local.bucket_names)
  # bucket        = local.bucket_names[count.index]
  force_destroy = "false"

  tags = each.value.tags

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = each.value.sse_algorithm
      }

      bucket_key_enabled = each.value.bucket_key_enabled
    }
  }

  versioning {
    enabled    = each.value.enabled
    mfa_delete = each.value.mfa_delete
  }
}