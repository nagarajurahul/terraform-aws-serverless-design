variable "iam_role_name" {
  description = ""
  type        = string
}

variable "iam_principal" {
  description = ""
  type        = string
}

variable "region" {
  description = ""
  type        = string
  default     = "us-east-2"
}

variable "iam_policies" {
  description = "Define IAM policies to be attached to the role"
  type = map(object({
    statements = list(object({
      sid       = optional(string)
      effect    = string
      actions   = list(string)
      resources = list(string)
    }))
  }))
}

variable "dynamodb_table_name" {
  description = ""
  type        = string
}

variable "dynamodb_table_hash_key" {
  description = ""
  type        = string
}

variable "dynamodb_table_attributes" {
  description = ""
  type        = map(string)
}

variable "global_secondary_index_name" {
  description = ""
  type        = string
}

variable "global_secondary_index_attributes" {
  description = ""
  type        = map(string)
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_function_description" {
  description = "Description of the Lambda function"
  type        = string
  default     = "Lambda function deployed via Terraform"
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
