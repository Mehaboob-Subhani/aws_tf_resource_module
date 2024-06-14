terraform {

	backend "s3" {
		bucket = "accout_name-tf-state"
		key    = "accout_name/terraform.tfstate"
		region = "us-east-1"
	}
} 
 
provider "aws" {
  region = "us-east-1"  # Change the region accordingly
}

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

# variable "lambdas" {
#   description = "List of Lambda function configurations"
#   type        = list(object({
#     tags                  = map(string)
#     tags_all         = map(string)  # New Lambda function attribute
#     function_name         = string  # New Lambda function attribute
#     role                  = string  # New Lambda function attribute
#     handler               = string  # New Lambda function attribute
#     runtime               = string  # New Lambda function attribute
#     filename              = string  # New Lambda function attribute
#     architectures         = string  # New Lambda function attribute
#     environment          = map(string)
#     memory_size         = string  # New Lambda function attribute
#     timeout         = string  # New Lambda function attribute
#   }))
# }

# variable "buckets" {
# }

module "s3_buckets" {
  source  = "./s3_module"
  buckets = var.buckets
}

module "lambda" {
  source  = "./lambda_module"
  lambdas = var.lambdas
}


module "ec2" {
  source  = "./ec2_module"
  ec2 = var.ec2
}


module "rds" {
  source  = "./rds_module"
  rds = var.rds
}


module "alb" {
  source  = "./alb_module"
  alb = var.alb
}