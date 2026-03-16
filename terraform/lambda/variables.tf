variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_function_description" {
  description = "Description of the Lambda function"
  type        = string
  default     = "Lambda function deployed via Terraform"
}

variable "lambda_iam_role_arn" {
  description = "IAM role ARN used by the Lambda function"
  type        = string
}

variable "lambda_runtime" {
  description = "Lambda runtime environment"
  type        = string
  default     = "python3.14"
}

variable "lambda_s3_bucket" {
  description = "S3 bucket containing Lambda deployment package"
  type        = string
}

variable "lambda_s3_key" {
  description = "S3 key of the Lambda deployment package"
  type        = string
}