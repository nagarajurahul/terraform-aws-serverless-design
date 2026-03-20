data "aws_caller_identity" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_bus
locals {
  iam_policies = {
    eventbridge_logs = {
      statements = [
        {
          effect    = "Allow"
          actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
          resources = ["${var.log_group_arn}:log-stream:*"]

          principal_identifiers = ["delivery.logs.amazonaws.com"]

          conditions = [
            {
              test     = "StringEquals"
              variable = "aws:SourceAccount"
              values   = [data.aws_caller_identity.current.account_id]
            },
            {
              test     = "ArnLike"
              variable = "aws:SourceArn"
              values = [
                var.log_delivery_source_arn
              ]
            }
          ]
        }
      ]
    }
  }
}