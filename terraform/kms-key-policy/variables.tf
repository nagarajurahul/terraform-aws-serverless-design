variable "kms_key_id" {
  type        = string
  description = ""
}

variable "eventbridge_source_arns" {
  type        = list(string)
  description = ""
}

variable "sqs_arns" {
  type        = list(string)
  description = ""
}

variable "lambda_role_arns" {
  type        = list(string)
  description = ""
}