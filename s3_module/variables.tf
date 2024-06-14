variable "buckets" {
  type = list(object({
    bucket_name       = string
    sse_algorithm     = string
    # ManagedStackSource = string
    bucket_key_enabled = bool
    enabled           = bool
    mfa_delete        = bool
    tags              = map(string)
  }))
  description = "A map of S3 bucket names"
  default = []
}

# variable "buckets" {
# }