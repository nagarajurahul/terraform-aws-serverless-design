variable "region" {
  description = ""
  type        = string
  default     = "us-east-2"
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

variable "lambdas" {
  description = "Map of Lambdas"

  type = map(object({
    function_description = string
    handler              = string
    runtime              = string
    iam_role_name        = string
    s3_bucket            = string
    s3_key               = string
  }))
}