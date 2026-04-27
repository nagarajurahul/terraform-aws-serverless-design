data "aws_caller_identity" "current" {}

locals {
  iam_policies = {
    "kms-key-policy" = {
      statements = [
        {
          sid       = "Enable IAM User Permissions",
          effect    = "Allow"
          actions   = ["kms:*"]
          resources = ["*"]
          principals = [
            {
              type        = "AWS"
              identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
            }
          ]
        }
      ]
    }
  }
}