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