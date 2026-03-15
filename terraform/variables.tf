variable "iam_role_name" {
  description = ""
  type        = string
}

variable "iam_policy_name" {
  description = ""
  type        = string
}

variable "iam_policy_description" {
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