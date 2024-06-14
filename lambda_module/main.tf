provider "aws" {
  region = "us-east-1"  # Change the region accordingly
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "accout_name_lambda" {
  for_each      = { for data in var.lambdas : data.function_name => data }

  function_name = each.value.function_name
  # count         = length(local.bucket_names)
  # bucket        = local.bucket_names[count.index]

  role = each.value.role

  tags = each.value.tags
 
  tags_all  = each.value.tags_all

  handler = each.value.handler
  
  runtime = each.value.runtime

  filename = each.value.filename

  environment {
    variables = each.value.environment
  }

  architectures = [each.value.architectures]

  timeout = each.value.timeout
  
  memory_size = each.value.memory_size
  
#   publish = each.value.publish
}