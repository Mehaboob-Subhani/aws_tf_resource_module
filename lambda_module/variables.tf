variable "lambdas" {
  description = "List of Lambda function configurations"
  type        = list(object({
    tags                  = map(string)
    tags_all         = map(string)  # New Lambda function attribute
    function_name         = string  # New Lambda function attribute
    role                  = string  # New Lambda function attribute
    handler               = string  # New Lambda function attribute
    runtime               = string  # New Lambda function attribute
    filename              = string  # New Lambda function attribute
    # image_uri             = string  # New Lambda function attribute
    # s3_key                = string  # New Lambda function attribute
    # s3_bucket             = string  # New Lambda function attribute
    architectures         = string  # New Lambda function attribute
    # environment           = optional(map(string))  # New Lambda function attribute
    environment          = map(string)
    memory_size         = string  # New Lambda function attribute
    timeout         = string  # New Lambda function attribute
    # publish        = bool
  }))
}